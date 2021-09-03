import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Services/FirebaseData.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/HorizontalContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/LeftContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/RightMiddleContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/RightOuterContainer.dart';
import 'package:wellyfe_app/Screen/UserProfileScreen/UserProfileScreen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    FirebaseData.getAllUserData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HorizontalContainer(
                title: "User",
                function: () {
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.fade,
                    child: UserProfileScreen(),
                  ));
                },
              ),
              SizedBox(height: size.height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.525,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LeftContainer(
                          function: () async {
                            FirebaseData.getAllTaskScheduleData(context);
                          },
                          title: "Schedule",
                        ),
                        LeftContainer(
                          function: () async {
                            FirebaseData.getAllSleepData(context);
                          },
                          title: "Sleep Tracker",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.525,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RightOuterContainer(
                          function: () async {
                            FirebaseData.getAllDoctorData();
                            FirebaseData.getAllAppointmentData(context);
                          },
                          title: "Therapy Care",
                        ),
                        RightMiddleContainer(),
                        RightOuterContainer(
                          function: () async {
                            FirebaseData.getAllDiaryData(context);
                          },
                          title: "Diary",
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.025),
              HorizontalContainer(
                title: "Mood Diary",
                function: () async {
                  FirebaseData.getAllMoodData(context);
                },
              ),
            ],
          ),

          // child: Transform.rotate(
          //   angle: 315 * pi / 180,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 75.0),
          //         child: Container(
          //           width: size.width * 0.8,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Container(
          //                     height: 50,
          //                     width: 50,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5.0),
          //                       color: Color(0XFFDFDFE7),
          //                     ),
          //                   ),
          //                   SizedBox(height: 20),
          //                   Container(
          //                     height: 75,
          //                     width: 75,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(15.0),
          //                         color: Color(0XFFF2F3F7),
          //                         boxShadow: [
          //                           BoxShadow(
          //                               blurRadius: 5.0,
          //                               offset: Offset(-3, -3),
          //                               color: Colors.white
          //                           ),
          //                           BoxShadow(
          //                               blurRadius: 5.0,
          //                               offset: Offset(3, 3),
          //                               color: Colors.black.withOpacity(.15)
          //                           )
          //                         ]
          //                     ),
          //                   )
          //                 ],
          //               ),
          //               Container(
          //                 height: 150,
          //                 width: 150,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(20.0),
          //                     color: Color(0XFFF2F3F7),
          //                     boxShadow: [
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(-3, -3),
          //                           color: Colors.white
          //                       ),
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(3, 3),
          //                           color: Colors.black.withOpacity(.15)
          //                       )
          //                     ]
          //                 ),
          //               ),
          //               Container(
          //                 height: 100,
          //                 width: 100,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(20.0),
          //                     color: Color(0XFFF2F3F7),
          //                     boxShadow: [
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(-3, -3),
          //                           color: Colors.white
          //                       ),
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(3, 3),
          //                           color: Colors.black.withOpacity(.15)
          //                       )
          //                     ]
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 100.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             ),
          //             Container(
          //               height: 150,
          //               width: 150,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             ),
          //             Container(
          //               height: 125,
          //               width: 125,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 275.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             ),
          //             SizedBox(width: 20),
          //             Container(
          //               height: 75,
          //               width: 75,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10.0),
          //                   color: Color(0XFFDFDFE7),
          //               ),
          //             ),
          //             SizedBox(width: 20),
          //             Container(
          //               height: 40,
          //               width: 40,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10.0),
          //                 color: Color(0XFFDFDFE7),
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        )
    );
  }
}






