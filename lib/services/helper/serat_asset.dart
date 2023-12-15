//
//  serat_asset.dart
//  Created on 2023 15 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

enum SeratAsset { namazLogo, appIcon, ayah, namazLogoAg }

extension SeratAssetExtension on SeratAsset {
  String get name {
    switch (this) {
      case SeratAsset.namazLogo:
        return 'assets/namaz_logo.png';
      case SeratAsset.appIcon:
        return 'assets/app_icon.png';
      case SeratAsset.ayah:
        return 'assets/icons/ayah.png';
      case SeratAsset.namazLogoAg:
        return 'assets/namaz_logo_ag.png';

      default:
        return '';
    }
  }
}
