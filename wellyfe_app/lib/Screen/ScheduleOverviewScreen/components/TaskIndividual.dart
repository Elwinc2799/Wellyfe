import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class TaskIndividual extends StatefulWidget {
  @override
  _TaskIndividualState createState() => _TaskIndividualState();

  final String task;
  final bool isDone;

  const TaskIndividual({
    required this.task,
    required this.isDone,
    Key? key,
  }) : super(key: key);
}

class _TaskIndividualState extends State<TaskIndividual> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.075,
      child: Column(
        children: [
          Row(
            children: [
              RoundCheckBox(
                isChecked: widget.isDone,
                uncheckedColor: Color(0XFFE5EBF2),
                checkedColor:  Colors.deepPurpleAccent,
                uncheckedWidget: Icon(
                  Icons.done,
                  color: Colors.deepPurpleAccent,
                  size: 20,
                ),
                onTap: (selected) {},
                size: 30,
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
                        fontSize: 17.5,
                        fontFamily: "NunitoSans",
                        fontWeight: FontWeight.w600,
                        color: widget.isDone ? Colors.grey[400] : Color(0XFF344460),
                        decoration: widget.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
