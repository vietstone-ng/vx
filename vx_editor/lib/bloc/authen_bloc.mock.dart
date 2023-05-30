part of 'authen_bloc.dart';

class MockAuthenBloc implements AuthenBloc {
  @override
  final _subject = BehaviorSubject<User?>();

  @override
  void dispose() {
    _subject.close();
  }

  @override
  Stream<User?> get stream => _subject.stream;

  MockAuthenBloc() {
    scheduleMicrotask(() {
      Future.delayed(
        const Duration(seconds: 1),
        () => _subject.add(User()), // have account
        // () => _subject.add(null), // no account
        // () => _subject.addError("No internet"), // network error
      );
    });
  }
}
