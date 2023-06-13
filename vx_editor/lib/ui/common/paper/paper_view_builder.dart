import 'package:flutter/material.dart';
import 'package:vx_editor/data/models/document.dart';
import 'package:vx_editor/ui/common/paper/paper_view.dart';
import 'package:vx_editor/ui/common/paper/paper_view_vm.dart';

class PaperViewBuilder extends StatelessWidget {
  const PaperViewBuilder({super.key, required this.vm, this.focusTable});
  final PaperViewVM vm;
  final Function(DocumentTable)? focusTable;
  @override
  Widget build(BuildContext context) {
    return PaperView(
      vm: vm,
      focusTable: focusTable,
    );
  }
}
