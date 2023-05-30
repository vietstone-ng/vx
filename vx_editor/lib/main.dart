import 'package:flutter/material.dart';
import 'package:vx_editor/infra/service_locator.dart';
import 'package:vx_editor/ui/screens/home/home_screen.dart';
import 'package:vx_editor/ui/screens/sign_in/sign_in_screen.dart';

void main() {
  setupServiceLocator();

  runApp(const EditorApp());
}

class EditorApp extends StatelessWidget {
  const EditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _SignInSwithcher(),
    );
  }
}

class _SignInSwithcher extends StatelessWidget {
  const _SignInSwithcher();

  @override
  Widget build(BuildContext context) {
    // return const Center(
    //   child: Text('Test'),
    // );

    return StreamBuilder(
      stream: authenBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          final message = snapshot.error?.toString() ?? '';
          return _ErrorScreen(message: message);
        }

        final user = snapshot.data;
        final state = snapshot.connectionState;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }

        return user != null ? const HomeScreen() : const SignInScreen();
      },
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Error: $message'),
      ),
    );
  }
}
