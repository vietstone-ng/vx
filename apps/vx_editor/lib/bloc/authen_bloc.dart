import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vx_editor/bloc/bloc.dart';
import 'package:vx_editor/data/models/user.dart';

part 'authen_bloc.mock.dart';

class AuthenBloc extends Bloc {
  final _subject = BehaviorSubject<User?>();

  @override
  void dispose() {
    _subject.close();
  }

  @override
  Stream<User?> get stream => _subject.stream;

  AuthenBloc();
}
