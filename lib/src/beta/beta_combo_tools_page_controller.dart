import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/models/combo_tools_items_model.dart';
import 'package:textgenie/src/pages/duplicate_cleaner_page.dart';
import 'package:velocity_x/velocity_x.dart';

class ComboToolsPageBetaController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final List<Items> items = [
    const Items(
        title: "Duplicate Remover",
        icon: Icons.difference_rounded,
        widget_: DuplicateRemoverPage()),
    Items(
      title: "Combo Extractor",
      icon: Icons.colorize_rounded,
      widget_: Container(
        child: "2".text.xl4.make(),
      ),
    ),
    Items(
      title: "Combo Combiner",
      icon: Icons.merge_rounded,
      widget_: Container(
        child: "2".text.xl4.make(),
      ),
    ),
    Items(
      title: "Email to User",
      icon: Icons.forward_to_inbox_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
    Items(
      title: "User to Email",
      icon: Icons.alternate_email_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
    Items(
      title: "Leech Combo",
      icon: Icons.anchor_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
    Items(
      title: "Email Sorter",
      icon: Icons.filter_list_off_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
    Items(
      title: "Hash Identifier",
      icon: Icons.tag_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
    Items(
      title: "Hash Generator",
      icon: Icons.generating_tokens_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
    Items(
      title: "Text Splitter",
      icon: Icons.call_split_rounded,
      widget_: Container(
        child: "3".text.xl5.make(),
      ),
    ),
  ].obs;

  void onSelected(int index) {
    selectedIndex.value = index;
    update();
  }
}
