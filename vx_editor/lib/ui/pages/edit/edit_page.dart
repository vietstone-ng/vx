import 'package:flutter/material.dart';
import 'package:vx_editor/ui/pages/edit/edit_page_vm.dart';
import 'package:vx_editor/ui/pages/edit/right_sidebar.dart';
import 'package:vx_editor/ui/common/paper/paper_view_builder.dart';

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
              constrained: false,
              minScale: 0.1,
              maxScale: 10,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              child: const PaperViewBuilder(),
            ),
          ),
          const RightSidebar(),
        ],
      ),
    );
  }
}
