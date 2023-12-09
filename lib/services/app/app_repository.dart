//
//  app_repository.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:serat/services/app/app.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/services/helper/saved_verses_schema.dart';

abstract class IAppRepository {
  Future<ReadingPageSchema> getPageData(int page);
  Future<List<SavedVerseSchema>> getSavedData();
}

class AppRepository implements IAppRepository {
  AppRepository();

  final App _app = App();

  @override
  Future<ReadingPageSchema> getPageData(int page) async {
    return await _app.getPageData(page);
  }

  @override
  Future<List<SavedVerseSchema>> getSavedData() async {
    return await _app.getSavedData();
  }
}
