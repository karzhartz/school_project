import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import "../utils/colors.dart" as appColors;

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: HexColor(appColors.blue3),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor(appColors.blue5)),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
