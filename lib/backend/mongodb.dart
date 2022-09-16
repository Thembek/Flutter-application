import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_main_application/backend/constant.dart';
import 'package:flutter_main_application/backend/mongoDbModel.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> signup(MongoDbModel data) async {
    try{
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data has been inserted, successfully.";
      } else {
        return "Something went wrong, while you were inserting your data.";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> login(MongoDbModel data) async {
    try {
      var authen = await userCollection.findOne(data.toJson());
      if (authen.isSuccess) {
        return "User found.";
      } else {
        return "User does not exist.";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
