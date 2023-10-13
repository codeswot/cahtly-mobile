import 'package:chatlly/users/data/user_data.dart';
import 'package:realm/realm.dart';

class UserDatabase {
  final _config = Configuration.local([UserData.schema]);

  addUsers(List<UserData> users) async {
    Realm realm = Realm(_config);

    realm.write(() {
      realm.addAll(users, update: true);
    });
  }

  List<UserData> getAllUsers() {
    Realm realm = Realm(_config);
    return realm.all<UserData>().map((e) => e).toList();
  }

  UserData? getUserById(String id) {
    Realm realm = Realm(_config);
    return realm.query<UserData>("id == '$id'").first;
  }
}
