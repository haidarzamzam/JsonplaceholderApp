import 'package:case_devido/model/category_model.dart';
import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';

import 'chip_category.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key key,
    @required CategoryModel data,
  })  : _data = data,
        super(key: key);

  final CategoryModel _data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: HexColor(ColorPalette['ColorAccent']),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_data.title,
                style: TextStyle(
                    fontSize: 18,
                    color: HexColor(ColorPalette['ColorPrimaryDark']),
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
                runSpacing: 5.0,
                children: _data.content
                    .map((e) => ChipCategory(data: e.code))
                    .toList()
                    .cast<Widget>()),
          ],
        ),
      ),
    );
  }
}
