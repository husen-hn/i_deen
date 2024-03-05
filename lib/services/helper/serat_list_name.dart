//
//  serat_list_name.dart
//  Created on 2024 05 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

enum SeratListName {
  ansarian,
  ayati,
  bahrampour,
  fooladvand,
  ghomshei,
  khorramdel,
  khorramshahi,
  makarem,
  moezzi,
  mojtabavi,
  light,
  dark,
  nokhodi,
  batele
}

extension SeratImgExtension on SeratListName {
  String get img {
    switch (this) {
      case SeratListName.ansarian:
        return 'assets/persons/ansarian.jpg';
      case SeratListName.ayati:
        return 'assets/persons/ayati.jpg';
      case SeratListName.bahrampour:
        return 'assets/persons/bahrampour.jpg';
      case SeratListName.fooladvand:
        return 'assets/persons/fooladvand.jpg';
      case SeratListName.ghomshei:
        return 'assets/persons/ghomshei.jpg';
      case SeratListName.khorramdel:
        return 'assets/persons/khorramdel.jpg';
      case SeratListName.khorramshahi:
        return 'assets/persons/khorramshahi.jpg';
      case SeratListName.makarem:
        return 'assets/persons/makarem.jpg';
      case SeratListName.moezzi:
        return 'assets/persons/moezzi.jpg';
      case SeratListName.mojtabavi:
        return 'assets/persons/mojtabavi.jpg';
      case SeratListName.light:
        return 'assets/themes/light.jpg';
      case SeratListName.batele:
        return 'assets/themes/batele.jpg';
      case SeratListName.nokhodi:
        return 'assets/themes/nokhodi.jpg';
      case SeratListName.dark:
        return 'assets/themes/dark.png';

      default:
        return '';
    }
  }
}

extension SeratNameExtension on SeratListName {
  String get name {
    switch (this) {
      case SeratListName.ansarian:
        return 'حسین انصاریان';
      case SeratListName.ayati:
        return 'عبدالمحمد آیتی';
      case SeratListName.bahrampour:
        return 'ابولفضل بهرام پور';
      case SeratListName.fooladvand:
        return 'محمدمهدی فولادوند';
      case SeratListName.ghomshei:
        return 'مهدی الهی قمشه‌ای';
      case SeratListName.khorramdel:
        return 'مصطفی خرم‌دل';
      case SeratListName.khorramshahi:
        return 'بهاءالدین خرمشاهی';
      case SeratListName.makarem:
        return 'مکارم شیرازی';
      case SeratListName.moezzi:
        return 'محمد کاظم معزی';
      case SeratListName.mojtabavi:
        return 'جلال الدین مجتبوی';
      case SeratListName.light:
        return 'روشن';
      case SeratListName.batele:
        return 'باطله';
      case SeratListName.nokhodi:
        return 'نخودی';
      case SeratListName.dark:
        return 'تاریک';

      default:
        return '';
    }
  }
}
