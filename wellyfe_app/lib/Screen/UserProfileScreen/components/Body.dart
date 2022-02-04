import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';
import 'package:wellyfe_app/Core/Model/UserProfile.dart';
import 'package:wellyfe_app/Screen/UserProfileScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/UserProfileScreen/components/TextNavigation.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ValueNotifier<File?> image = ValueNotifier(null);
  UploadTask? uploadTask;
  final ImagePicker _picker = ImagePicker();
  final fireStoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  String mood = Mood.moodOfToday==""? "happy":Mood.moodOfToday;

  Future pickImage() async {
    try {
      final XFile? _pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (_pickedFile == null)
        return;

      File? croppedImage = await ImageCropper.cropImage(
          sourcePath: _pickedFile.path,
          aspectRatio: CropAspectRatio(
            ratioX: 0.56, ratioY: 1,
          ),
          compressQuality: 100,
          maxWidth: 600,
          maxHeight: 1066,
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
    } on Exception {

    }
  }

  Future uploadFileToFirebase() async {
    final imageFileName= basename(image.value!.path);
    var imageFile = FirebaseStorage.instance.ref().child("images").child(imageFileName);
    UploadTask uploadTask = imageFile.putFile(image.value!);
    TaskSnapshot taskSnapshot = await uploadTask;

    String url = await taskSnapshot.ref.getDownloadURL();
    UserProfile.userDetails.imageUrl = url;

    await fireStoreInstance
        .collection("users")
        .doc(firebaseUser!.uid)
        .update({
          "imageUrl": url
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      image: image,
      children: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.575),
          Center(
            child: GlassmorphicContainer(
              height: size.height * 0.325,
              width: size.width * 0.875,
              borderRadius: 20,
              blur: 10,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF000000).withOpacity(0.2),
                    Color(0xFF000000).withOpacity(0.15),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF).withOpacity(0),
                  Color(0xFFFFFFFF).withOpacity(0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          UserProfile.userDetails.name,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "NunitoSans",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Image(
                            image: AssetImage("assets/logo/edit.png"), width: 25, height: 25,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      UserProfile.userDetails.userEmail,
                      style: TextStyle(
                        fontSize: 17.5,
                        fontFamily: "NunitoSans",
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    TextNavigation(
                      text: "You're feeling ${mood} today.",
                      navigationTitle: "Recommendation",
                      function: () {},
                    ),
                    SizedBox(height: size.height * 0.025),
                    TextNavigation(
                      text: "You're an ${UserProfile.userDetails.personality} person.",
                      navigationTitle: "Personality",
                      function: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


