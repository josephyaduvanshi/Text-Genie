import 'package:flutter/material.dart';
import 'package:textgenie/src/widgets/custom_grid_tile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/tools_specifiers_model.dart';

class CustomMenuPage extends StatelessWidget {
  final int itemCount;
  final List<ToolSpecifierModel> homePageItems;
  const CustomMenuPage(
      {super.key, required this.itemCount, required this.homePageItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.15,
        crossAxisCount: 6,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) => GridTile(
        child: CustomGridTile(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Image.asset(
                  homePageItems[index].imageAsset,
                  fit: BoxFit.cover,
                  height: 50,
                ),
              ),
              Flexible(
                child: homePageItems[index]
                    .name
                    .text
                    .bold
                    .center
                    .scale(0.8)
                    .maxLines(2)
                    .make()
                    .px(3),
              ),
            ],
          ),
        ),
      ),
    ).p(12);
  }
}
