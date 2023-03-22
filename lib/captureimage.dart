// ignore_for_file: avoid_print, avoid_returning_null_for_void, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pothole_detector/imagepreview.dart';

late List<CameraDescription> cameras;

class CaptureImage extends StatefulWidget {
  const CaptureImage({super.key});

  @override
  State<CaptureImage> createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  late CameraController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("access was denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 75),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: CameraPreview(_controller),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    if (!_controller.value.isInitialized) {
                      return null;
                    }
                    if (_controller.value.isTakingPicture) {
                      return null;
                    }
                    try {
                      await _controller.setFlashMode(FlashMode.auto);
                      XFile file = await _controller.takePicture();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImagePreview(file)));
                    } on CameraException catch (e) {
                      debugPrint("Error occured while taking picture: $e");
                      return null;
                    }
                  },
                  color: Colors.white,
                  child: const Text('Take a picture',style: TextStyle(fontSize: 15),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
