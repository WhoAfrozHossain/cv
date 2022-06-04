import 'package:bloc/bloc.dart';
import 'package:cv/features/frontend/data/model/all_data_model.dart';
import 'package:equatable/equatable.dart';
import '../../../../main.dart';
import '../../domain/usecase/frontend_use_case.dart';
import '../function/frontend_functions.dart';

part 'frontend_event.dart';
part 'frontend_state.dart';

class FrontendBloc extends Bloc<FrontendEvent, FrontendState> {
  final FrontendUseCase frontendUseCase;

  FrontendBloc({required this.frontendUseCase}) : super(FrontendInitial()) {
    on<FrontendEvent>((event, emit) async {
      if (event is GetFrontendDataEvent) {
        await sl<FrontendFunctions>().getFrontendData(
            event, emit, frontendUseCase);
      }

      if (event is PostStoreContactEvent) {
        await sl<FrontendFunctions>()
            .postStoreContact(event, emit, frontendUseCase);
      }
    });
  }
}
