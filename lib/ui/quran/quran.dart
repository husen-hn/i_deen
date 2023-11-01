//
//  quran.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/app/app_cubit.dart';
import 'package:i_deen/controller/home/home_cubit.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<AppCubit>().changeLanguage('en');
                },
                child: const Text('change'))));
  }
}
