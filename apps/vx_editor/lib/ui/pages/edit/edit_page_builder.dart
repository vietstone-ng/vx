import 'package:flutter/material.dart';

import 'edit_page.dart';
import 'edit_page_vm.dart';

class EditPageBuilder extends StatelessWidget {
  const EditPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = EditPageVM();
    return EditPage(vm: vm);
  }
}
