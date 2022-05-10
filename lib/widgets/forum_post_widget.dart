import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hexcolor/hexcolor.dart';
import "../utils/colors.dart" as appColors;

class ForumPostWidget extends StatelessWidget {
  final int id;
  final String posterProfileImgUrl;
  final String posterName;
  final String description;
  final String title;
  final int stars;

  const ForumPostWidget({
    Key? key,
    required this.id,
    required this.posterProfileImgUrl,
    required this.posterName,
    required this.description,
    required this.title,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(
        top: 6,
        bottom: 2,
        left: 6,
        right: 6,
      ),
      color: HexColor(appColors.blue4),
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: NetworkImage(posterProfileImgUrl),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    posterName,
                    style: TextStyle(
                      color: HexColor(appColors.text2),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: HexColor(appColors.blue6),
                    ),
                  ),
                ],
              ),
              StarRankingWidget(
                stars: stars,
              ),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: HexColor(appColors.text2),
                fontWeight: FontWeight.bold,
              ),
            ),
            _getDescrition(),
          ],
        ),
        // trailing: Icon(Icons.more_horiz),
      ),
    );
  }

  Widget _getDescrition() {
    if (description.length >= 138) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: description.substring(0, (134)),
              style: TextStyle(
                color: HexColor(appColors.text2),
              ),
            ),
            TextSpan(
              text: "...",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }
    return RichText(
      text: TextSpan(
        text: description,
        style: TextStyle(
          color: HexColor(appColors.text2),
        ),
      ),
    );
  }
}

class StarRankingWidget extends StatelessWidget {
  final int stars;
  int? maxStars;
  double? starSize;

  StarRankingWidget({
    Key? key,
    required this.stars,
    this.maxStars = 5,
    this.starSize = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: _generateStars(),
    );
  }

  List<Widget> _generateStars() {
    return List.generate(maxStars!, (index) {
      if (index < stars) {
        return Icon(
          Icons.star_rate_rounded,
          size: starSize,
          color: Colors.red,
        );
      }
      return Icon(
        Icons.star_rate_rounded,
        size: starSize,
      );
    });
  }
}
