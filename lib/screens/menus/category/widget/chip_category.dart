import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';

class ChipCategory extends StatelessWidget {
  const ChipCategory({
    Key key,
    this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: HexColor(ColorPalette['ColorPrimary']),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Text(
          data,
          style: TextStyle(color: HexColor(ColorPalette['ColorAccent'])),
        ),
      ),
    );
  }
}
