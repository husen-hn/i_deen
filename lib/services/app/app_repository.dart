//
//  app_repository.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:serat/services/app/app.dart';
import 'package:serat/services/helper/tr_data_success_schema.dart';
import 'package:serat/services/helper/translation.dart';

abstract class IAppRepository {
  Future<TrDataSuccessSchema> getTrData(Translation tr);
}

class AppRepository implements IAppRepository {
  AppRepository();

  @override
  Future<TrDataSuccessSchema> getTrData(Translation tr) async {
    return await App().getTrData(tr);
  }
}
