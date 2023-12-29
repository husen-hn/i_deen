//
//  serat_icon.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

enum SeratIcon {
  back,
  backRTL,
  verse,
  nameOfGod,
  namazLogo,
  appIcon,
  appIconShadow,
  namazLogoAg,
  lastRead,
  prayerIcon,
  lamp,
  bookmark,
  quran,
  save,
  saved,
  menu,
  menuRTL,
  cloud1,
  cloud2,
  cloud3,
  star,
  share
}

extension CatExtension on SeratIcon {
  String get name {
    switch (this) {
      case SeratIcon.back:
        return 'assets/icons/back_ltr.png';
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
      case SeratIcon.appIconShadow:
        return 'assets/app_icon_shadow.png';
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
      case SeratIcon.save:
        return 'assets/icons/save.png';
      case SeratIcon.saved:
        return 'assets/icons/saved.png';
      case SeratIcon.menuRTL:
        return 'assets/icons/menu_rtl.png';
      case SeratIcon.menu:
        return 'assets/icons/menu.png';
      case SeratIcon.cloud1:
        return 'assets/icons/cloud1.png';
      case SeratIcon.cloud2:
        return 'assets/icons/cloud2.png';
      case SeratIcon.cloud3:
        return 'assets/icons/cloud3.png';
      case SeratIcon.star:
        return 'assets/icons/star.png';
      case SeratIcon.share:
        return 'assets/icons/share.png';

      default:
        return '';
    }
  }
}
