import 'package:flutter/material.dart';
import 'package:vx_editor/ui/edit/edit_page_vm.dart';
import 'package:vx_editor/ui/edit/right_sidebar.dart';
import 'package:vx_editor/ui/paper/paper_view_builder.dart';

import 'left_sidebar.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key, required this.vm});

  final EditPageVM vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('_editor_page_'),
      ),
      body: Row(
        children: [
          const LeftSidebar(),
          Expanded(
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 10,
              boundaryMargin: const EdgeInsets.all(20.0),
              child: const Center(child: PaperViewBuilder()),
            ),
          ),
          const RightSidebar(),
        ],
      ),
    );
  }
}
