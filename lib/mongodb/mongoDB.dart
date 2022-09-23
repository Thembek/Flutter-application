import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_main_application/mongodb/constant.dart';
import 'package:flutter_main_application/mongodb/MongoDbModel.dart';

class MongoDatabase {
  static var db, userCollection;
  static connection() async {
    db = await Db.create(MONGO_CON_URL)
  }
}
