// To parse this JSON data, do
//
//     final appData = appDataFromMap(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'hive_model.g.dart';

AppData appDataFromMap(String str) => AppData.fromMap(json.decode(str));

String appDataToMap(AppData data) => json.encode(data.toMap());

@HiveType(typeId: 1)
class AppData {
  @HiveField(1)
  int? totalCount;
  @HiveField(2)
  bool? incompleteResults;
  @HiveField(3)
  List<Item>? items;

  AppData({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory AppData.fromMap(Map<String, dynamic> json) => AppData(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 2)
class Item {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? nodeId;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? fullName;
  @HiveField(5)
  Owner? owner;
  @HiveField(6)
  String? description;
  @HiveField(7)
  String? createdAt;
  @HiveField(8)
  String? updatedAt;
  @HiveField(9)
  double? score;

  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.score,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    owner: json["owner"] == null ? null : Owner.fromMap(json["owner"]),
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    score: json["score"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "owner": owner?.toMap(),
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "score": score,
  };
}

@HiveType(typeId: 3)
class Owner {
  @HiveField(1)
  String? login;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? nodeId;
  @HiveField(4)
  String? avatarUrl;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
  });

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toMap() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
  };
}
