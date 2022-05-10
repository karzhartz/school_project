import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/colors.dart' as appColors;

class HeaderNavWidget extends StatelessWidget {
  HeaderNavWidget({Key? key, this.children}) : super(key: key);

  List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: children ?? [],
      ),
      height: 50,
    );
  }
}

class HeaderNavWidgetItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final TextStyle? titleTextStyle;
  final int? id;
  final ValueNotifier<int>? selectedId;

  const HeaderNavWidgetItem({
    Key? key,
    this.onTap,
    required this.title,
    this.titleTextStyle,
    this.id,
    this.selectedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headerItemTextStyle = titleTextStyle ??
        GoogleFonts.notoSans(
          color: _getTextColor(),
        );
    // TODO: implement build
    return InkWell(
      onTap: () {
        if (selectedId != null || id != null) selectedId!.value = id!;
        if (onTap != null) {
          onTap!();
        }
      },
      child: Ink(
        color: _getInkColor(),
        child: Center(
          child: Text(title, style: headerItemTextStyle),
        ),
      ),
    );
  }

  Color _getInkColor() {
    if (selectedId != null && id != null && selectedId!.value == id!) {
      return HexColor(appColors.blue3);
    }
    return HexColor(appColors.blue4);
  }

  Color _getTextColor() {
    if (selectedId != null && id != null && selectedId!.value == id!) {
      return HexColor(appColors.text1);
    }
    return HexColor(appColors.blue2);
  }
}
