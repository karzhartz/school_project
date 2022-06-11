import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TagShape extends StatelessWidget {
  const TagShape({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: HexColor("#06648c"),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "#${name}",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
