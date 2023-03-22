// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pothole_detector/map.dart';

class ImagePreview extends StatefulWidget {
  ImagePreview(this.file, {super.key});
  XFile file;
  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.file(picture),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveLocationPage()),
                    );
                  },
                  child: const Text('Upload image')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveLocationPage()),
                    );
                  },
                  child: const Text('Send live location')),
            ],
          )
        ],
      ),
    );
  }
}
