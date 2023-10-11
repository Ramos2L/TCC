import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_extend/share_extend.dart';

class PDFScreen extends StatefulWidget {
  final String path;
  const PDFScreen({required this.path, super.key});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  final Completer<PDFViewController> _controller = Completer<PDFViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            onPressed: () {
              ShareExtend.share(widget.path, 'file', sharePanelTitle: 'Enviar pdf');
            },
            icon: const Icon(Icons.share_rounded),
          ),
        ],
      ),
      body: PDFView(
        filePath: widget.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (pages) {
          setState(() => pages = pages);
        },
        onError: (error) {
          debugPrint(error.toString());
        },
        onPageError: (page, error) {
          debugPrint('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
      ),
    );
  }
}
