import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vx_editor/ui/edit/edit_page_builder.dart';
import 'package:vx_editor/ui/edit/left_sidebar.dart';
import 'package:vx_editor/ui/edit/right_sidebar.dart';
import 'package:vx_editor/ui/paper/paper_view.dart';

Widget createEditScreen() {
  return const MaterialApp(home: EditPageBuilder());
}

void main() {
  testWidgets('EditPage has 3 parts', (tester) async {
    await tester.pumpWidget(createEditScreen());

    expect(find.byType(LeftSidebar), findsOneWidget);
    expect(find.byType(RightSidebar), findsOneWidget);
    expect(find.byType(PaperView), findsOneWidget);
  });

  testWidgets('PaperView can be zoomed in/out', (tester) async {
    await tester.pumpWidget(createEditScreen());

    expect(
        find.descendant(
            of: find.byType(InteractiveViewer),
            matching: find.byType(PaperView)),
        findsOneWidget);
  });
}
