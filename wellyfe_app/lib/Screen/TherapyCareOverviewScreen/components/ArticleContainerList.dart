import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/ArticleContianer.dart';

class ArticleContainerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 17.5),
      child: Container(
        width: size.width - 17.5,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              ArticleContainer(),
              ArticleContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

