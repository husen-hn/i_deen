//
//  tr_data_success_schema.dart
//  Created on 2023 26 November.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

// class TrDataSuccessSchema {

class TrDataSuccessSchema {
  TrDataSuccessSchema({
    required this.list,
  });

  final List<ListElement> list;

  factory TrDataSuccessSchema.fromJson(Map<String, dynamic> json) {
    return TrDataSuccessSchema(
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
    required this.verses,
  });

  final int? number;
  final List<Verse> verses;

  factory ListElement.fromJson(Map<String, dynamic> json) {
    return ListElement(
      number: json["number"],
      verses: json["verses"] == null
          ? []
          : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
    );
  }
}

class Verse {
  Verse({
    required this.number,
    required this.translation,
  });

  final int? number;
  final String? translation;

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      number: json["number"],
      translation: json["translation"],
    );
  }
}
