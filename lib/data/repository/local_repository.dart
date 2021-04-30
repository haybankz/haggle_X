import 'package:graphql_flutter/graphql_flutter.dart';

class LocalRepository {

  Future<void> saveData(String key, dynamic value) async{
    var box = await HiveStore.openBox("auth");
    box.put(key, value);
  }

  Future<dynamic> getData(String key, {defaultValue = ""}) async {
    var box = await HiveStore.openBox("auth");
    return box.get(key, defaultValue: defaultValue);
  }

}