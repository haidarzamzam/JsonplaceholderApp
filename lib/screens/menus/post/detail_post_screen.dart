import 'package:flutter/material.dart';
import 'package:jsonplaceholder_app/model/post_model.dart';
import 'package:jsonplaceholder_app/utils/constant.dart';
import 'package:jsonplaceholder_app/utils/util.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({Key key, this.item}) : super(key: key);

  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(ColorPalette['ColorAccent']),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Detail Post",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: HexColor(ColorPalette['ColorPrimaryDark'])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: HexColor(ColorPalette['ColorPrimaryDark']),
              ),
            ),
            SizedBox(height: 16),
            Text(
              item.body,
              style: TextStyle(
                fontSize: 16,
                color: HexColor(ColorPalette['ColorPrimary']),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
