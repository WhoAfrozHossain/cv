part of 'frontend_bloc.dart';

abstract class FrontendEvent extends Equatable {
  const FrontendEvent();
}

class GetFrontendDataEvent extends FrontendEvent {
  GetFrontendDataEvent();

  @override
  List<Object?> get props => [];
}

class PostStoreContactEvent extends FrontendEvent {
  final Map<String, String> body;

  PostStoreContactEvent({required this.body});

  @override
  List<Object?> get props => [body];
}
