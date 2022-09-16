import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
  MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  ObjectId id;
  String firstName;
  String lastName;
  String email;
  String password;
  
  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    id: json["_id"],
    firstName: json['firstName'],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
  };
}