import 'package:hive_flutter/hive_flutter.dart';
part 'gpmodel.g.dart';

@HiveType(typeId: 1)
class grMessage {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String content;
  @HiveField(2)
  late String sex;
  @HiveField(3)
  late String uid;
  @HiveField(4)
  late String dt;

  grMessage(String id, String content, String sex, String uid, String dt) {
    this.id = id;
    this.content = content;
    this.sex = sex;
    this.uid = uid;
    this.dt = dt;
  }
}
