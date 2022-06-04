part of 'frontend_bloc.dart';

abstract class FrontendState extends Equatable {
  const FrontendState();
}

class FrontendInitial extends FrontendState {
  @override
  List<Object> get props => [];
}

class FrontendLoadingState extends FrontendState {
  final bool? isPagination;

  FrontendLoadingState({this.isPagination});

  @override
  List<Object?> get props => [isPagination];
}

class FrontendDataSuccessState extends FrontendState {
  final AllDataModel? frontendData;

  FrontendDataSuccessState({required this.frontendData});

  @override
  List<Object?> get props => [frontendData];
}

class FrontendDataErrorState extends FrontendState {
  final String? message;

  FrontendDataErrorState({this.message});

  @override
  List<Object?> get props => [message];
}