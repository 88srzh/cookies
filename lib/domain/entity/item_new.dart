import 'package:hive/hive.dart';

part 'item_new.g.dart';

@HiveType(typeId: 1)
class ItemNew {
  @HiveField(0)
  String titleNew;

  ItemNew({
    this.titleNew,
  });
}
