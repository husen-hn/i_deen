//
//  main.dart
//  Created on 2023 24 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:i_deen/bootstrap.dart';
import 'package:i_deen/services/helper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bootstrap();
}
