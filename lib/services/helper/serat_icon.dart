//
//  serat_icon.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

enum SeratIcon {
  backRTL,
  verse,
  nameOfGod,
  namazLogo,
  appIcon,
  namazLogoAg,
  lastRead,
  prayerIcon,
  lamp,
  bookmark,
  quran
}

extension CatExtension on SeratIcon {
  String get name {
    switch (this) {
      case SeratIcon.backRTL:
        return 'assets/icons/back_rtl.png';
      case SeratIcon.verse:
        return 'assets/icons/ayah.png';
      case SeratIcon.nameOfGod:
        return 'assets/besmelah.png';
      case SeratIcon.namazLogo:
        return 'assets/namaz_logo.png';
      case SeratIcon.appIcon:
        return 'assets/app_icon.png';
      case SeratIcon.namazLogoAg:
        return 'assets/namaz_logo_ag.png';
      case SeratIcon.lastRead:
        return 'assets/icons/last_read.png';
      case SeratIcon.prayerIcon:
        return 'assets/icons/prayer_icon.png';
      case SeratIcon.lamp:
        return 'assets/icons/lamp_icon.png';
      case SeratIcon.bookmark:
        return 'assets/icons/bookmark_icon.png';
      case SeratIcon.quran:
        return 'assets/icons/quran.png';

      default:
        return '';
    }
  }
}
