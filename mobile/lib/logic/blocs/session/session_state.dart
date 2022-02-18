part of 'session_bloc.dart';

class SessionState extends Equatable {
  const SessionState({
    this.sessions = const <Session>[],
  });

  final List<Session> sessions;

  SessionState copyWith({List<Session>? sessions}) {
    return SessionState(
      sessions: sessions ?? this.sessions,
    );
  }

  @override
  String toString() {
    return '''SessionState { sessions: ${sessions.length} }''';
  }

  @override
  List<Object> get props => [sessions];
}
