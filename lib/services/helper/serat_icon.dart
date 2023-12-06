//
//  serat_icon.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

enum SeratIcon { backRTL, verse, nameOfGod }

extension CatExtension on SeratIcon {
  String get name {
    switch (this) {
      case SeratIcon.backRTL:
        return 'assets/icons/back_rtl.png';
      case SeratIcon.verse:
        return 'assets/icons/ayah.png';
      case SeratIcon.nameOfGod:
        return 'assets/besmelah.png';

      default:
        return '';
    }
  }
}
