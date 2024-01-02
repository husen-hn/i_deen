//
//  app_repository.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:serat/services/app/app.dart';
import 'package:serat/services/helper/juz_starter_schema.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/services/helper/saved_verses_schema.dart';

abstract class IAppRepository {
  Future<ReadingPageSchema> getPageData(
      {required int page, List<int?>? itemToScroll});
  Future<List<SavedVerseSchema>> getSavedData();
  JuzStarterSchema starterJuzData(int juzNumber);
  Future<bool> checkConnection();
}

class AppRepository implements IAppRepository {
  AppRepository();

  final App _app = App();

  @override
  Future<ReadingPageSchema> getPageData(
      {required int page, List<int?>? itemToScroll}) async {
    return await _app.getPageData(page: page, itemToScroll: itemToScroll);
  }

  @override
  Future<List<SavedVerseSchema>> getSavedData() async {
    return await _app.getSavedData();
  }

  @override
  JuzStarterSchema starterJuzData(int juzNumber) =>
      _app.starterJuzData(juzNumber);

  @override
  Future<bool> checkConnection() => _app.checkConnection();
}
