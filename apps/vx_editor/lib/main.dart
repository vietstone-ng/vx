import 'package:flutter/material.dart';
import 'package:vx_editor/ui/edit/edit_page_builder.dart';

import 'ui/edit/edit_page.dart';

void main() {
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
      home: const EditPageBuilder(),
    );
  }
}
