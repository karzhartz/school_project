import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import "../utils/colors.dart" as appColors;

class AnnouncementWidget extends HookWidget {
  final String thumbnail_url;
  final String title;
  final String description;
  Function()? onTap;

  AnnouncementWidget({
    Key? key,
    required this.thumbnail_url,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  TextStyle descriptionStyle = TextStyle(
    color: HexColor(appColors.text3),
    fontSize: 12.5,
  );

  @override
  Widget build(BuildContext context) {
    final showDescription = useState(false);

    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        bottom: 8.0,
        left: 5,
        right: 5,
      ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: 250,
            ),
            width: Get.width,
            height: Get.width - 50,
            child: Image.network(
              thumbnail_url,
              fit: BoxFit.cover,
            ),
          ),
          SelectableText(
            title.toUpperCase(),
            style: TextStyle(
              color: HexColor(appColors.text2),
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: _makeDescriptionText(showDescription),
          ),
        ],
      ),
    );
  }

  void _toggleShowText(ValueNotifier<bool> showText) {
    showText.value = !showText.value;
  }

  Widget _makeDescriptionText(ValueNotifier<bool> showText) {
    if (description.length >= 100 && showText.value == false) {
      return GestureDetector(
        onTap: () {
          _toggleShowText(showText);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: description.substring(0, 100 - 13),
                style: descriptionStyle,
              ),
              TextSpan(
                text: "...read more.",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        _toggleShowText(showText);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: description,
              style: descriptionStyle,
            ),
            TextSpan(
              text: "...read less.",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
