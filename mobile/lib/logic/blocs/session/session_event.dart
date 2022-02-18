part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSessions extends SessionEvent {}
