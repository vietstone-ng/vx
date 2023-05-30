abstract class Bloc<T> {
  void dispose();

  Stream<T> get stream;
}
