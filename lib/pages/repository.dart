import "package:flutter/material.dart";
import 'package:school_ui/widgets/search_widget.dart';

class RepositoryPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SearchWidget(),
        ],
      ),
    );
  }
}
