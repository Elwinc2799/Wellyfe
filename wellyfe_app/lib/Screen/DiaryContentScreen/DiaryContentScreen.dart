import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/components/Body.dart';

class DiaryContentScreen extends StatelessWidget {

  const DiaryContentScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
