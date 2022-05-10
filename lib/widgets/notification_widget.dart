import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import "../utils/colors.dart" as appColors;

class NotificationWidget extends StatelessWidget {
  final String thumbnail_url;
  final String title;
  final String descriptioon;
  Function()? onTap;

  NotificationWidget({
    Key? key,
    required this.thumbnail_url,
    required this.title,
    required this.descriptioon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        bottom: 6.0,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(thumbnail_url),
        ),
        title: Text(
          title,
          style: TextStyle(
            color:
                HexColor(appColors.text2), //Color.fromARGB(255, 218, 242, 246),
          ),
        ),
        subtitle: FittedBox(
          child: Text(
            descriptioon,
            style: TextStyle(
              color: HexColor(appColors.text2),
              fontSize: 12.5,
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "45min ago",
              style: TextStyle(
                color: HexColor(appColors.blue3),
                fontSize: 11,
              ),
            ),
          ],
        ),
        onTap: onTap ?? () {},
      ),
    );
  }
}
