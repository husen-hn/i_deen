//
//  juz.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/services/app/app_repository.dart';
import 'package:i_deen/widgets/number_btn.dart';

class Juz extends StatelessWidget {
  final AppRepository appRepository;
  const Juz({super.key, required this.appRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<QuranCubit>().getTotalJuzCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () => context.pushNamed('juz-reading',
                      pathParameters: {'juzNumber': (index + 1).toString()}),
                  child: NumberBtn(number: index + 1));
            });
      },
    );
  }
}
