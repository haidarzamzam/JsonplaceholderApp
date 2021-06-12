import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemShimmerPost extends StatelessWidget {
  const ItemShimmerPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor(ColorPalette['ColorAccent']),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
