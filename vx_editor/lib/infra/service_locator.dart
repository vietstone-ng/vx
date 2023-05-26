import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:vx_editor/bloc/authen_bloc.dart';

void _standardSetup() {
  GetIt.I.registerLazySingleton(() => AuthenBloc());
}

void _debugSetup() {
  // mock AuthenBloc
  GetIt.I.unregister<AuthenBloc>();
  GetIt.I.registerLazySingleton<AuthenBloc>(() => MockAuthenBloc());
}

void setupServiceLocator() {
  _standardSetup();

  // debug setup here
  if (kDebugMode) {
    _debugSetup();
  }
}

// Global getters
AuthenBloc get authenBloc => GetIt.I.get();
