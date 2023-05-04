import 'package:flutter/material.dart';
import 'package:vx_editor/ui/paper/paper_view_vm.dart';

class PaperView extends StatelessWidget {
  const PaperView({super.key, required this.vm});

  final PaperViewVM vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 297,
      color: Colors.brown.shade50,
      // color: Colors.red,
    );
  }
}
