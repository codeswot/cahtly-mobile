import 'package:realm/realm.dart';

part 'user_data.g.dart';

@RealmModel()
class _UserData {
  @PrimaryKey()
  late String id;
  late String email;
  late String? name;
  late int? age;
}
