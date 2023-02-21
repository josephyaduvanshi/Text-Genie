import 'package:hive_flutter/hive_flutter.dart';

part 'email_to_user_history_model.g.dart';

@HiveType(typeId: 0)
class EmailToUserHistoryModel extends HiveObject {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String fileName;
  @HiveField(2)
  final String fileSize;
  @HiveField(3)
  final String numberOfLines;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final String fileContent;

  EmailToUserHistoryModel({
    required this.type,
    required this.fileName,
    required this.fileSize,
    required this.numberOfLines,
    required this.date,
    required this.fileContent,
  });
}
