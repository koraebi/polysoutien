import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:mobile/logic/models/session.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:mobile/logic/globals.dart' as globals;

part 'session_event.dart';
part 'session_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionState()) {
    on<GetSessions>(
      _onGetSessions,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetSessions(
      GetSessions event, Emitter<SessionState> emit) async {
    return emit(state.copyWith(
      sessions: globals.user.sessions,
    ));
  }
}
