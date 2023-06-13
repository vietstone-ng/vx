import 'package:flutter/material.dart';
import 'package:vx_editor/data/models/document.dart';
import 'package:vx_editor/ui/common/input_field/vx_input_field.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({
    super.key,
    required this.deleteTable,
    this.currentFocusTable,
    required this.updateTable,
  });
  final VoidCallback deleteTable;
  final Function(DocumentTable table) updateTable;
  final DocumentTable? currentFocusTable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.red.shade100,
      child: currentFocusTable == null
          ? const Text('Chưa có bảng nào được chọn')
          : _buildInfoTable(
              currentFocusTable: currentFocusTable,
              deleteTable: deleteTable,
              updateTableFunction: updateTable,
            ),
    );
  }
}

Widget _buildInfoTable({
  DocumentTable? currentFocusTable,
  required final VoidCallback deleteTable,
  required Function(DocumentTable table) updateTableFunction,
}) {
  final rowNumController = TextEditingController(
    text: currentFocusTable?.attributes.rowNum.toString() ?? "",
  );
  final colNumController = TextEditingController(
    text: currentFocusTable?.attributes.colNum.toString() ?? "",
  );
  final cellHeightController = TextEditingController(
    text: currentFocusTable?.attributes.cellHeight.toString() ?? "",
  );
  final cellWidthController = TextEditingController(
    text: currentFocusTable?.attributes.cellWidth.toString() ?? "",
  );
  final leftPaddingController = TextEditingController(
    text: currentFocusTable?.attributes.paddingLeft?.toString() ?? "",
  );
  final rightPaddingController = TextEditingController(
    text: currentFocusTable?.attributes.paddingRight?.toString() ?? "",
  );
  final topPaddingController = TextEditingController(
    text: currentFocusTable?.attributes.paddingTop?.toString() ?? "",
  );
  final bottomPaddingController = TextEditingController(
    text: currentFocusTable?.attributes.paddingBottom?.toString() ?? "",
  );

  final formKey = GlobalKey<FormState>();

  void update() {
    final updatedTable = currentFocusTable?.copyWith(
      attributes: currentFocusTable.attributes.copyWith(
        rowNum: int.parse(rowNumController.text),
        colNum: int.parse(colNumController.text),
        cellHeight: int.parse(cellHeightController.text),
        cellWidth: int.parse(cellWidthController.text),
        paddingBottom: bottomPaddingController.text.isNotEmpty
            ? double.parse(bottomPaddingController.text)
            : null,
        paddingLeft: leftPaddingController.text.isNotEmpty
            ? double.parse(leftPaddingController.text)
            : null,
        paddingRight: rightPaddingController.text.isNotEmpty
            ? double.parse(rightPaddingController.text)
            : null,
        paddingTop: topPaddingController.text.isNotEmpty
            ? double.parse(topPaddingController.text)
            : null,
      ),
    );

    updateTableFunction.call(updatedTable!);
  }

  return Form(
    key: formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(currentFocusTable?.name ?? ""),
        const SizedBox(height: 12),
        InputField(
          controller: rowNumController,
          title: 'Số hàng',
          validator: (string) {
            if (string?.isEmpty ?? true) {
              return "Vui lòng số hàng";
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        InputField(
          controller: colNumController,
          title: 'Số cột',
          validator: (string) {
            if (string?.isEmpty ?? true) {
              return "Vui lòng số cột";
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        InputField(
          controller: cellHeightController,
          title: 'Chiều cao ô',
          validator: (string) {
            if (string?.isEmpty ?? true) {
              return "Vui lòng chiều cao ô";
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        InputField(
          controller: cellWidthController,
          title: 'Chiều rộng ô',
          validator: (string) {
            if (string?.isEmpty ?? true) {
              return "Vui lòng chiều rộng ô";
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        InputField(
          controller: leftPaddingController,
          title: 'Căn trái',
        ),
        const SizedBox(height: 12),
        InputField(
          controller: rightPaddingController,
          title: 'Căn phải',
        ),
        const SizedBox(height: 12),
        InputField(
          controller: topPaddingController,
          title: 'Căn trên',
        ),
        const SizedBox(height: 12),
        InputField(
          controller: bottomPaddingController,
          title: 'Căn dưới',
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: update,
          child: const Text("Xác nhận thay đổi"),
        ),
        const SizedBox(height: 100),
        OutlinedButton(
          style: OutlinedButton.styleFrom(backgroundColor: Colors.red[500]),
          onPressed: deleteTable,
          child: const Text("Xóa bảng"),
        )
      ],
    ),
  );
}
