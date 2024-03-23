//
//  articles_fail_schema.dart
//  Created on 2024 21 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

class ArticlesFailSchema {
  ArticlesFailSchema({
    required this.code,
    required this.message,
    required this.data,
  });

  final String? code;
  final String? message;
  final Data? data;

  factory ArticlesFailSchema.fromJson(Map<String, dynamic> json) {
    return ArticlesFailSchema(
      code: json["code"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.status,
  });

  final int? status;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      status: json["status"],
    );
  }
}
