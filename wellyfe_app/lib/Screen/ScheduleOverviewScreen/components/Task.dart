import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();

  final String task;

  const Task({
    required this.task,
    Key? key,
  }) : super(key: key);
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  NeumorphicCheckbox(
                    value: isChecked,
                    onChanged: (dynamic) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    style: NeumorphicCheckboxStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      unselectedDepth: 10,
                      selectedColor: Colors.teal,
                    ),
                  ),
                  SizedBox(width: size.width * 0.05),
                  Container(
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: "NunitoSans",
                            fontWeight: FontWeight.w500,
                            color: isChecked ? Colors.grey[400] : Color(0XFF344460),
                            decoration: isChecked ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Divider(
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ],
                    )
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Container(
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      size: size.width * 0.075,
                      color: Color(0XFF344460),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
