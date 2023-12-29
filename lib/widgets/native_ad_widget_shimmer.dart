//
//  native_ad_widget.dart
//  Created on 2023 28 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NativeAdWidgetShimmer extends StatelessWidget {
  const NativeAdWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 360,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            )));
  }
}
