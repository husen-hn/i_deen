//
//  home_cubit.dart
//  Created on 2023 02 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState().copyWith(
          status: () => HomeStatus.initial,
          btnNvIndex: () => 0,
        ));

  void setActiveButtonIndex(int index) {
    emit(state.copyWith(
        status: () => HomeStatus.btnNv, btnNvIndex: () => index));
  }

  Color activeBtnNavColor(btnNvIndex, index) =>
      btnNvIndex == index ? const Color(0xFF672CBC) : const Color(0xFF8789A3);
}
