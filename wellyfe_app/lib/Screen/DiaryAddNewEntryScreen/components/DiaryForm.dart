import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/components/EmojiRow.dart';

class DiaryForm extends StatefulWidget {
  @override
  _DiaryFormState createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTitleContainer(),
          EmojiRow(),
          GestureDetector(child: buildContentContainer())
        ],
      ),
    );
  }

  Container buildContentContainer() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.25,
      child: TextField(
        decoration: InputDecoration(
          hintText: "How was your day?",
          hintStyle: TextStyle(
            fontSize: 30,
            fontFamily: "Montserrat",
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 30,
          fontFamily: "Montserrat",
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w400,
        ),
        controller: _contentController,
      ),
    );
  }

  Container buildTitleContainer() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      width: size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Title",
          hintStyle: TextStyle(
            fontSize: 40,
            fontFamily: "Montserrat",
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontFamily: "Montserrat",
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w600,
        ),
        controller: _titleController,
      ),
    );
  }
}
