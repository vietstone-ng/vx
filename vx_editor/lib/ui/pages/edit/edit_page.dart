import 'package:flutter/material.dart';
import 'package:vx_editor/data/models/document.dart';
import 'package:vx_editor/ui/common/paper/paper_view_vm.dart';
import 'package:vx_editor/ui/pages/edit/create_table.dart';
import 'package:vx_editor/ui/pages/edit/edit_page_vm.dart';
import 'package:vx_editor/ui/pages/edit/right_sidebar.dart';
import 'package:vx_editor/ui/common/paper/paper_view_builder.dart';

import 'left_sidebar.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.vm});

  final EditPageVM vm;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  DocumentTable? currentFocusTable;

  PaperViewVM paperViewVM = PaperViewVM(
    document: Document(
      type: "type",
      code: "No name",
      table: [],
    ),
  );

  void createNewTable() {
    showDialog(
      context: context,
      builder: (ctx) => const CreateTableDialog(),
    ).then((param) {
      if (param != null) {
        final resultParam = (param as CreateTableParam);

        //Add new table to list
        paperViewVM.document.table.add(
          DocumentTable(
            name: "Bảng ${paperViewVM.document.table.length + 1}",
            attributes: Attributes(
              colNum: resultParam.colNul,
              rowNum: resultParam.rowNum,
              cellHeight: resultParam.cellHeight,
              cellWidth: resultParam.cellWidth,
              paddingLeft: resultParam.leftPadding?.toDouble(),
              paddingTop: resultParam.topPadding?.toDouble(),
              paddingBottom: resultParam.bottomPadding?.toDouble(),
              paddingRight: resultParam.rightpadding?.toDouble(),
            ),
          ),
        );

        setState(() {});
      }
    });
  }

  void deleteCurrentFocusTable() {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        title: const Text('Bạn có chắc chắn muốn xóa bảng này'),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Hủy bỏ'),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.red[500]),
            onPressed: () {
              Navigator.of(context).pop();
              paperViewVM.document.table.remove(currentFocusTable);
              currentFocusTable = null;
              setState(() {});
            },
            child: const Text(
              'Xác nhận',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void focusTable(DocumentTable table) {
    currentFocusTable = table;
    setState(() {});
  }

  void updateCurrentFocusTable(DocumentTable updateTable) {
    final index = paperViewVM.document.table.indexOf(currentFocusTable!);
    paperViewVM.document.table[index] = updateTable;
    currentFocusTable = updateTable;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('_editor_page_'),
      ),
      body: Row(
        children: [
          LeftSidebar(
            createNewTable: createNewTable,
          ),
          Expanded(
            child: InteractiveViewer(
              constrained: false,
              minScale: 0.1,
              maxScale: 10,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              child: PaperViewBuilder(
                vm: paperViewVM,
                focusTable: focusTable,
              ),
            ),
          ),
          RightSidebar(
            deleteTable: deleteCurrentFocusTable,
            currentFocusTable: currentFocusTable,
            updateTable: updateCurrentFocusTable,
          ),
        ],
      ),
    );
  }
}
