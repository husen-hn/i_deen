//
//  page.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/widgets/surah_number.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<QuranCubit>().getTotalPagesCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return ElevatedButton.icon(
                  onPressed: () {},
                  icon: SurahNumber(
                      number: index + 1,
                      iconColor: Colors.black,
                      textColor: Colors.black,
                      size: 40),
                  label: const Text(''),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFDF98FA)),
                  ));
            });
      },
    );
  }
}
