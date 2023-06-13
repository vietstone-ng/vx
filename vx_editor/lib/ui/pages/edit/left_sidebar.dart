import 'package:flutter/material.dart';

class LeftSidebar extends StatelessWidget {
  const LeftSidebar({super.key, required this.createNewTable});
  final VoidCallback createNewTable;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.amber.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: createNewTable,
            child: const Text("Tạo mới bảng"),
          )
        ],
      ),
    );
  }
}
