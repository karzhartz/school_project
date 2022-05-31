import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Repository extends StatelessWidget {
  Repository({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#092836"),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.deepOrange,
      )),
    );
  }
}
