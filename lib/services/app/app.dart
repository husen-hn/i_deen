//
//  app.dart
//  Created on 2023 26 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:i_deen/services/helper/tr_data_success_schema.dart';
import 'package:i_deen/services/helper/translation.dart';

class App {
  Future<TrDataSuccessSchema> getTrData(Translation tr) async {
    String response = tr == Translation.makarem
        ? await _readLocalJson(Translation.makarem.name!)
        : await _readLocalJson('');

    return TrDataSuccessSchema.fromJson(jsonDecode(response));
  }

  Future<String> _readLocalJson(String path) async =>
      await rootBundle.loadString(path);
}
