import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:vx_editor/ui/paper/paper_view_vm.dart';

// TODO: consider to remove `pdf` package
final _paperFormat = PdfPageFormat.a3.landscape.copyWith(
  marginTop: 0,
  marginBottom: 0,
  marginLeft: 0,
  marginRight: 0,
);

// Calculate the maximum width and height of the editor based on the page format
final _paperWidth = _paperFormat.availableWidth;
final _paperHeight = _paperFormat.availableHeight;

class PaperView extends StatelessWidget {
  const PaperView({super.key, required this.vm});

  final PaperViewVM vm;

  @override
  Widget build(BuildContext context) {
    print('width $_paperWidth height $_paperHeight');
    return Container(
      width: _paperWidth,
      height: _paperHeight,
      color: Colors.brown.shade50,
      child: const Center(child: Text("Test")),
    );
  }
}
