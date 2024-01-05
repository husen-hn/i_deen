//
//  tr_data_success_schema.dart
//  Created on 2024 05 January.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

class OriginalDataSuccessSchema {
  OriginalDataSuccessSchema({
    required this.list,
  });

  final List<ListElement> list;

  factory OriginalDataSuccessSchema.fromJson(Map<String, dynamic> json) {
    return OriginalDataSuccessSchema(
      list: json["list"] == null
          ? []
          : List<ListElement>.from(
              json["list"]!.map((x) => ListElement.fromJson(x))),
    );
  }
}

class ListElement {
  ListElement({
    required this.number,
    required this.name,
    required this.transliteration,
    required this.verses,
  });

  final int? number;
  final String? name;
  final String? transliteration;
  final List<OriginalVerse> verses;

  factory ListElement.fromJson(Map<String, dynamic> json) {
    return ListElement(
      number: json["number"],
      name: json["name"],
      transliteration: json["transliteration"],
      verses: json["verses"] == null
          ? []
          : List<OriginalVerse>.from(
              json["verses"]!.map((x) => OriginalVerse.fromJson(x))),
    );
  }
}

class OriginalVerse {
  OriginalVerse({
    required this.number,
    required this.section,
    required this.content,
  });

  final int? number;
  final int? section;
  final String? content;

  factory OriginalVerse.fromJson(Map<String, dynamic> json) {
    return OriginalVerse(
      number: json["number"],
      section: json["section"],
      content: json["content"],
    );
  }
}
