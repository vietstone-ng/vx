// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:vx_editor/ui/common/input_field/vx_input_field.dart';

class CreateTableDialog extends StatelessWidget {
  const CreateTableDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final rowNumController = TextEditingController();
    final colNumController = TextEditingController();
    final cellHeightController = TextEditingController();
    final cellWidthController = TextEditingController();
    final leftPaddingController = TextEditingController();
    final rightPaddingController = TextEditingController();
    final topPaddingController = TextEditingController();
    final bottomPaddingController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Dialog(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              InputField(
                controller: rowNumController,
                title: 'Nhập số hàng',
                validator: (string) {
                  if (string?.isEmpty ?? true) {
                    return "Vui lòng nhập số hàng";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              InputField(
                controller: colNumController,
                title: 'Nhập số cột',
                validator: (string) {
                  if (string?.isEmpty ?? true) {
                    return "Vui lòng nhập số cột";
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
                    return "Vui lòng nhập chiều cao ô";
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
                    return "Vui lòng nhập chiều rộng ô";
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final param = CreateTableParam(
                      rowNum: int.parse(rowNumController.text),
                      colNul: int.parse(colNumController.text),
                      cellHeight: int.parse(cellHeightController.text),
                      cellWidth: int.parse(cellWidthController.text),
                      bottomPadding: bottomPaddingController.text.isNotEmpty
                          ? int.parse(bottomPaddingController.text)
                          : null,
                      leftPadding: leftPaddingController.text.isNotEmpty
                          ? int.parse(leftPaddingController.text)
                          : null,
                      rightpadding: rightPaddingController.text.isNotEmpty
                          ? int.parse(rightPaddingController.text)
                          : null,
                      topPadding: topPaddingController.text.isNotEmpty
                          ? int.parse(topPaddingController.text)
                          : null,
                    );
                    Navigator.of(context).pop(param);
                  }
                },
                child: const Text('OK'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateTableParam {
  final int rowNum;
  final int colNul;
  final int cellHeight;
  final int cellWidth;
  final int? topPadding;
  final int? bottomPadding;
  final int? rightpadding;
  final int? leftPadding;

  CreateTableParam({
    required this.rowNum,
    required this.colNul,
    required this.cellHeight,
    required this.cellWidth,
    this.topPadding,
    this.bottomPadding,
    this.rightpadding,
    this.leftPadding,
  });
}
