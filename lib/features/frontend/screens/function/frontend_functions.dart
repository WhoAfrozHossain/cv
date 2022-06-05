import 'dart:async';
import 'dart:convert';

import 'package:cv/features/frontend/data/model/all_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';
import 'package:cv/core/error/failures.dart';

import '../../../../core/widgets/custom_text_widget.dart';
import '../../domain/usecase/frontend_use_case.dart';
import '../bloc/frontend_bloc.dart';

class FrontendFunctions {
  late BuildContext context;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  AllDataModel? frontendDataModel;

  bool isLoadingData = false;

  init(BuildContext context) {
    this.context = context;

    // BlocProvider.of<ProductBloc>(context).add(GetProductListEvent());
    // BlocProvider.of<FrontendBloc>(context).add(GetFrontendDataEvent());
  }

  Future getFrontendData(GetFrontendDataEvent event,
      Emitter<FrontendState> emit, FrontendUseCase frontendUseCase) async {
    emit(FrontendLoadingState());

    showAlertDialog();

    Either<Failure, AppApiResponse> _res =
        await frontendUseCase.call(FrontendDataPrams());

    _res.fold((l) async {
      isLoadingData = false;

      emit(FrontendDataErrorState());
    }, (r) {
      frontendDataModel = AllDataModel.fromJson(jsonDecode(r.body!));

      isLoadingData = false;

      emit(FrontendDataSuccessState(frontendData: frontendDataModel));
    });
  }

  showAlertDialog() {
    Widget okButton = TextButton(
      child: const CustomTextWidget(text: "Continue"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const CustomTextWidget(text: "Under Construction"),
      content:
          const CustomTextWidget(text: "This site is in under construction."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future postStoreContact(PostStoreContactEvent event,
      Emitter<FrontendState> emit, FrontendUseCase frontendUseCase) async {
    Either<Failure, AppApiResponse> _res =
        await frontendUseCase.call(PostContactPrams(body: event.body));

    _res.fold((l) async {
      

      emit(FrontendDataErrorState());
    }, (r) {
      nameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    });
  }
}
