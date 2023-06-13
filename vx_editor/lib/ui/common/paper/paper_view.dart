import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:vx_editor/data/models/document.dart';
import 'package:vx_editor/ui/common/paper/paper_view_vm.dart';

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
  const PaperView({super.key, required this.vm, this.focusTable});

  final PaperViewVM vm;
  final Function(DocumentTable)? focusTable;
  @override
  Widget build(BuildContext context) {
    print('width $_paperWidth height $_paperHeight');
    return Container(
      width: _paperWidth,
      height: _paperHeight,
      color: Colors.brown.shade50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildTableList(vm.document, focusTable),
      ),
    );
  }
}

/*
  Layout table list by row.
  Consider to build by stack.
*/
List<Widget> _buildTableList(
  Document document,
  Function(DocumentTable)? focusTable,
) {
  return document.table
      .map(
        (e) => Padding(
          padding: EdgeInsets.only(
            top: e.attributes.paddingTop ?? 0,
            right: e.attributes.paddingRight ?? 0,
            left: e.attributes.paddingLeft ?? 0,
            bottom: e.attributes.paddingBottom ?? 0,
          ),
          child: Table(
            border: TableBorder.all(),
            defaultColumnWidth:
                FixedColumnWidth(e.attributes.cellWidth.toDouble()),
            children: [
              //Build row
              ...List.generate(
                e.attributes.rowNum,
                (rowindex) => TableRow(children: [
                  //Build column
                  ...List.generate(e.attributes.colNum, (colindex) {
                    final textcontroller = TextEditingController();
                    return Container(
                      alignment: Alignment.center,
                      width: e.attributes.cellHeight.toDouble(),
                      child: TextField(
                        controller: textcontroller,
                        onTap: () {
                          focusTable!(e);
                        },
                        textAlign: TextAlign.center,
                        onEditingComplete: () {},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    );
                  }).toList()
                ]),
              )
            ],
          ),
        ),
      )
      .toList();
}
