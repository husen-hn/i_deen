//
//  bookmark.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

enum SeratFont { bTitr, bZar, amiri, quranTaha, amiriQuran, arabQuranIslamic }

extension CatExtension on SeratFont {
  String? get name {
    switch (this) {
      case SeratFont.bTitr:
        return 'BTitr';
      case SeratFont.bZar:
        return 'BZar';
      case SeratFont.amiri:
        return 'Amiri';
      case SeratFont.amiriQuran:
        return 'AmiriQuran';
      case SeratFont.arabQuranIslamic:
        return 'ArabQuranIslamic';
      case SeratFont.quranTaha:
        return 'QuranTaha';

      default:
        return null;
    }
  }
}
