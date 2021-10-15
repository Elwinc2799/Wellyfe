import 'package:flutter/material.dart';

class DoctorIndividualContainer extends StatelessWidget {
  const DoctorIndividualContainer({
    Key? key,
    required this.therapy,
    required this.name,
    required this.experience,
    required this.function,
  }) : super(key: key);

  final String therapy;
  final String name;
  final int experience;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.12,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            color: Color(0XFFE5EBF2),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(-3, -3),
                  color: Colors.white.withOpacity(0.75)
              ),
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(.25)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0XFFE5EBF2),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(-3, -3),
                          color: Colors.white
                      ),
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(3, 3),
                          color: Colors.black.withOpacity(.25)
                      )
                    ]
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Text(
                        name.substring(4, 5),
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "NunitoSans",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(width: size.width * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    therapy,
                    style: TextStyle(
                      fontSize: 17.5,
                      fontFamily: "NunitoSans",
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 22.5,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    experience.toString() + " years",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "NunitoSans",
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}