import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () async {
          String url = 'https://www.nature.com/articles/d41586-021-02690-5';

          await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
        },
        child: Container(
          height: size.height * 0.275,
          width: size.width * 0.425,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.5 - 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage("assets/pictures/article1.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                Text(
                  "Young People’s Mental Health",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                   fontSize: 17.5,
                   fontFamily: "NunitoSans",
                   color: Color(0XFF394D70),
                   fontWeight: FontWeight.w700,
                 ),
                ),
                Text(
                  "by Nature Portfolio",
                  style: TextStyle(
                   fontSize: 15,
                   fontFamily: "NunitoSans",
                   color: Color(0XFF394D70).withOpacity(0.5),
                   fontWeight: FontWeight.w700,
                 ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}