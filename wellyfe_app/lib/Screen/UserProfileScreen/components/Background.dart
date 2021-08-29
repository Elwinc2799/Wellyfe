import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/UserProfile.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.children,
    required this.image,
  }) : super(key: key);

  final Widget children;
  final ValueNotifier<File?> image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String source = UserProfile.userDetails.imageUrl;
    String backupImage = "https://firebasestorage.googleapis.com/v0/b/wellyfe-d650c.appspot.com/o/images%2Fimage_cropper_1629540305968.jpg?alt=media&token=8bc5b75d-0bb6-4f2f-ba88-9fe83a8e76fc";

    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          ValueListenableBuilder<File?>(
            valueListenable: image,
            builder: (BuildContext context, File? list, Widget? children) {
              return Container(
                height: size.height,
                width: size.width,
                child: image.value == null
                  ? Image.network(
                    source == ""
                        ? backupImage : source,
                    fit: BoxFit.cover,
                  )
                  : Image.file(
                    image.value!,
                    fit: BoxFit.cover,
                  ),
              );
            }
          ),
          children,
        ],
      ),
    );
  }
}
