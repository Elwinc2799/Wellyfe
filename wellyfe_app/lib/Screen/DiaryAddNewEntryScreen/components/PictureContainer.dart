import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';

class PictureContainer extends StatefulWidget {
  @override
  _PictureContainerState createState() => _PictureContainerState();
}

class _PictureContainerState extends State<PictureContainer> {

  ValueNotifier<File?> image = ValueNotifier(null);
  UploadTask? uploadTask;
  final ImagePicker _picker = ImagePicker();

  Future pickImage() async {
    try {
      final XFile? _pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (_pickedFile == null)
        return;

      File? croppedImage = await ImageCropper.cropImage(
        sourcePath: _pickedFile.path,
        aspectRatio: CropAspectRatio(
          ratioX: 1, ratioY: 1,
        ),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.transparent,
          toolbarTitle: "Image Cropper",
          statusBarColor: Colors.transparent,
          backgroundColor: Colors.white
        )
      );

      setState(() {
        image.value = File(croppedImage!.path);
      });

      uploadFileToFirebase();
    } on PlatformException {

    }
  }

  Future uploadFileToFirebase() async {
    final imageFileName= basename(image.value!.path);
    var imageFile = FirebaseStorage.instance.ref().child("images").child(imageFileName);
    UploadTask uploadTask = imageFile.putFile(image.value!);
    TaskSnapshot taskSnapshot = await uploadTask;

    String url = await taskSnapshot.ref.getDownloadURL();
    Diary.newImageUrl = url;
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


