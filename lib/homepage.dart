// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:pothole_detector/map.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = '';
  
  void imageSaved() {
    const snackBar = SnackBar(
      content: Text('Image saved to gallery.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('--- W E L C O M E ---'),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: RadialGradient(colors: [Colors.white,Colors.orange],radius:1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');
                    await GallerySaver.saveImage(file!.path);
                    imageSaved();
                  },
                  child: const Text(
                    'Capture image',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Center(
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropoIHEFIHWEertyAll(Colors.blue)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveLocationPage()),
                    );
                  },
                  child: const Text(
                    'Get live location',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
