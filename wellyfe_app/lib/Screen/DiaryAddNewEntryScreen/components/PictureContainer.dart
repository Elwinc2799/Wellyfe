import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PictureContainer extends StatefulWidget {
  @override
  _PictureContainerState createState() => _PictureContainerState();
}

class _PictureContainerState extends State<PictureContainer> {

  ValueNotifier<File?> image = ValueNotifier(null);
  final ImagePicker _picker = ImagePicker();

  Future pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null)
        return;

      this.image.value = File(image.path);
    } on PlatformException {

    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      height: size.height * 0.45,
      width: size.width,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      color: Colors.grey.shade300.withOpacity(0.75),
      child: ValueListenableBuilder<File?>(
        valueListenable: image,
        builder: (BuildContext context, File? list, Widget? children) {
          return image.value == null
              ? Center(
                child: GestureDetector(
                  onTap: pickImage,
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Image(image: AssetImage("assets/logo/plus.png"),)
                  ),
                ),
              )
              : Image.file(
                image.value!,
                height: size.height * 0.45,
                width: size.width,
                fit: BoxFit.cover,
              );
        },
      ),
    );
  }
}


