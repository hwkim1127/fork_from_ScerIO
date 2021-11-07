import 'package:pdf_renderer/src/web/document/document.dart';
import 'package:pdf_renderer/src/web/pdfjs.dart';
import 'package:pdf_renderer/src/web/resources/repository.dart';

class DocumentRepository extends Repository<Document> {
  /// Register document in repository
  Document register(PdfjsDocument renderer) {
    final document = Document(
      id: uuid.v1(),
      document: renderer,
    );
    set(document.id, document);
    return document;
  }

  @override
  void close(String? id) {
    get(id)!.close();
    super.close(id);
  }
}
