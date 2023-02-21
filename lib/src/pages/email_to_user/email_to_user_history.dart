import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:textgenie/src/database/adapters/email_to_user_history_model.dart';
import 'package:textgenie/src/utils/text_genie_utils.dart';
import 'package:textgenie/src/widgets/dialogs.dart';
import 'package:velocity_x/velocity_x.dart';

class EmailToUserHistory extends StatelessWidget {
  final Box<EmailToUserHistoryModel>? box;
  const EmailToUserHistory({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<EmailToUserHistoryModel>>(
        valueListenable: box!.listenable(),
        builder: (BuildContext context, Box<EmailToUserHistoryModel> value,
            Widget? child) {
          return Expanded(
            child: ListView.builder(
                itemCount: value.values.toList().length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 6,
                    child: ListTile(
                      onTap: () async {
                        await CustomDialog.historyPreviewDialog(
                            context: context,
                            content: value.getAt(index)!.fileContent);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: value.getAt(index)!.type.text.make().py(2),
                      isThreeLine: true,
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getTypeState(value.getAt(index)!.type)
                              ? "File Size: ${value.getAt(index)!.fileSize}"
                                  .text
                                  .semiBold
                                  .make()
                                  .py(2)
                              : 0.heightBox,
                          _getTypeState(value.getAt(index)!.type)
                              ? 'File Name: ${value.getAt(index)!.fileName}'
                                  .text
                                  .semiBold
                                  .overflow(TextOverflow.ellipsis)
                                  .make()
                                  .py(2)
                              : 0.heightBox,
                          "Type: "
                              .richText
                              .withTextSpanChildren([
                                value
                                    .getAt(index)!
                                    .type
                                    .split(" ")[3]
                                    .textSpan
                                    .color(Colors.blue)
                                    .bold
                                    .make()
                              ])
                              .semiBold
                              .make()
                              .py(2),
                          "Number of Lines: ${value.getAt(index)!.numberOfLines}"
                              .text
                              .semiBold
                              .make()
                              .py(2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Date: ${TextGenieUtils.getPrettyDateWithTimeAgo(value.getAt(index)!.date)}"
                                  .text
                                  .semiBold
                                  .make(),
                              "(Tap to Preview)".text.green400.semiBold.make(),
                            ],
                          ).py(2),
                          4.heightBox,
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          value.deleteAt(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ).py(5);
                }).p(12),
          );
        });
  }

  bool _getTypeState(String text) {
    final Map<String, bool> map = {
      "Email to User File": true,
      "Email to User Text": false,
    };
    return map[text] ?? false;
  }
}
