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
          width: size.width * 0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.5,
                height: size.height * 0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)
                  ),
                  child: Image(
                    image: AssetImage("assets/pictures/article1.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 10, right: 10.0),
                child: Column(
                  children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}