import 'package:web/web.dart' as web;

void openPdfInNewTab(String pdfUrl) {
  web.window.open(pdfUrl, '_blank');
}
