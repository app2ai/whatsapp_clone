import 'dart:io';
import 'package:flutter/material.dart';

class CamPreview extends StatefulWidget {
  final String imagePath;
  const CamPreview({Key key, this.imagePath}): super(key: key);

  @override
  _CamPreviewState createState() => _CamPreviewState(imgPath: imagePath);
}

class _CamPreviewState extends State<CamPreview> {

  final String imgPath;
  _CamPreviewState({Key key, @required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(imgPath)),
    );
  }
}
