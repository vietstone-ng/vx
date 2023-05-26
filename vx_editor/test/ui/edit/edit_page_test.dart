import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vx_editor/ui/pages/edit/edit_page_builder.dart';
import 'package:vx_editor/ui/pages/edit/left_sidebar.dart';
import 'package:vx_editor/ui/pages/edit/right_sidebar.dart';
import 'package:vx_editor/ui/common/paper/paper_view.dart';

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

  testWidgets('PaperView can be zoomed in/out inside InteractiveViewer',
      (tester) async {
    await tester.pumpWidget(createEditScreen());

    final zoomFind = find.byType(InteractiveViewer);
    final zoom = tester.widget<InteractiveViewer>(zoomFind);

    expect(zoomFind, findsOneWidget);
    expect(
        find.descendant(
          of: zoomFind,
          matching: find.byType(PaperView),
        ),
        findsOneWidget);
    expect(zoom.constrained, false);
  });
}
