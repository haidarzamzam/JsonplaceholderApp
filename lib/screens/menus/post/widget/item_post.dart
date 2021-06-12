import 'package:case_devido/model/post_model.dart';
import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({
    Key key,
    @required PostModel data,
  })  : _data = data,
        super(key: key);

  final PostModel _data;

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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor(ColorPalette['ColorPrimary']),
                ),
                child: Text(
                  _data.id.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: HexColor(ColorPalette['ColorAccent'])),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(ColorPalette['ColorPrimaryDark']),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(_data.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor(ColorPalette['ColorPrimary']),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
