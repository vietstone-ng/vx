import 'package:vx_editor/data/models/document.dart';

class PaperViewVM {
  final Document document;
  PaperViewVM({
    required this.document,
  });

  PaperViewVM copyWith(Document? document) {
    return PaperViewVM(
      document: document ?? this.document,
    );
  }
}
