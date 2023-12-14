//
//  app_repository.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/app/app.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/services/helper/saved_verses_schema.dart';

abstract class IAppRepository {
  Future<ReadingPageSchema> getPageData(
      int page, List<int> itemToScroll, Size size);
  Future<List<SavedVerseSchema>> getSavedData();
}

class AppRepository implements IAppRepository {
  AppRepository();

  final App _app = App();

  @override
  Future<ReadingPageSchema> getPageData(
      int page, List<int> itemToScroll, Size size) async {
    return await _app.getPageData(page, itemToScroll, size);
  }

  @override
  Future<List<SavedVerseSchema>> getSavedData() async {
    return await _app.getSavedData();
  }
}
