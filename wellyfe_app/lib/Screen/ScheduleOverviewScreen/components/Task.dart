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
      height: size.height * 0.075,
      child: Column(
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
                  unselectedDepth: -20,
                  selectedColor: Color(0XFF9371FF),
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
                        fontWeight: FontWeight.w600,
                        color: isChecked ? Colors.grey[400] : Color(0XFF344460),
                        decoration: isChecked ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0, 50.0, 0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
