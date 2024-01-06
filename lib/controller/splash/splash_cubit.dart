//
//  splash_cubit.dart
//  Created on 2024 05 January.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:serat/services/app/app_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppRepository appRepository;
  SplashCubit({required this.appRepository})
      : super(const SplashState().copyWith(
          status: () => SplashStatus.initial,
          networkConnection: () => false,
          vpnConnection: () => false,
        ));
}
