import 'package:flutter/material.dart';
import 'package:vx_editor/ui/paper/paper_view.dart';
import 'package:vx_editor/ui/paper/paper_view_vm.dart';

class PaperViewBuilder extends StatelessWidget {
  const PaperViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = PaperViewVM();
    return PaperView(vm: vm);
  }
}
