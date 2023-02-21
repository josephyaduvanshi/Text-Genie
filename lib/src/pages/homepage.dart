import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/constants/homepage_constants.dart';
import 'package:textgenie/src/controllers/home_page_controller.dart';
import 'package:textgenie/src/widgets/custom_tab_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            'Text Genie'.text.bold.make().pOnly(right: 38).shimmer(
                  duration: 4.seconds,
                  primaryColor: Colors.purple,
                  secondaryColor: Colors.blue,
                ),
            const Expanded(child: CupertinoSearchTextField()),
          ],
        ),
        centerTitle: false,
        elevation: 3,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ).shimmer(
            duration: 4.seconds,
            primaryColor: Colors.purple,
            secondaryColor: Colors.blue,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ).shimmer(
            duration: 4.seconds,
            primaryColor: Colors.purple,
            secondaryColor: Colors.blue,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ).shimmer(
            duration: 4.seconds,
            primaryColor: Colors.purple,
            secondaryColor: Colors.blue,
          ),
        ],
      ),
      body: GetBuilder<HomePageController>(
          init: controller,
          builder: (controller) {
            return DefaultTabController(
              length: controller.tabsName.length,
              child: Column(
                children: [
                  CustomTabBarWidget(
                    tabs: List.generate(controller.tabsName.length, (index) {
                      if (index == 0) {
                        return const Tab(text: 'All Tools').px(8).shimmer(
                              duration: 4.seconds,
                              primaryColor: Colors.red,
                              secondaryColor: Colors.blue,
                            );
                      }
                      return Tab(
                        text: controller.tabsName[index],
                      ).px(8);
                    }).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: HomePageConstants.homePageWidgets,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
