import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class MusicCloud extends StatefulWidget {
  const MusicCloud({Key? key}) : super(key: key);

  @override
  _MusicCloudState createState() => _MusicCloudState();
}

class _MusicCloudState extends State<MusicCloud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfViewer.openAsset('assets/images/1.pdf'),
    );
  }
}
