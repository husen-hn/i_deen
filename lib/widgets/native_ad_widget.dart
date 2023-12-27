//
//  native_ad_widget.dart
//  Created on 2023 26 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:adivery/adivery_ads.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';

class NativeAdWidget extends StatelessWidget {
  final NativeAd nativeAd;
  const NativeAdWidget({super.key, required this.nativeAd});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => nativeAd.recordClick(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: const LinearGradient(
            colors: [Color(0xFF9055FF), Color(0xFFDF98FA)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9055FF).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              // Main Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: nativeAd.image ?? Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Icon
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          30), // Image radius
                                      child: nativeAd.icon ?? Container(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title
                                      Text(
                                        nativeAd.headline ?? '',
                                        textAlign: TextAlign.justify,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: SeratFont.bTitr.name,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      // Description
                                      Text(
                                        nativeAd.description ?? '',
                                        textAlign: TextAlign.justify,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: SeratFont.bZar.name,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Btn
                            InkWell(
                              onTap: () => nativeAd.recordClick(),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF9055FF),
                                      Color(0xFFDF98FA)
                                    ],
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(1.5),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    nativeAd.callToAction ?? '',
                                    style: TextStyle(
                                        fontFamily: SeratFont.bTitr.name,
                                        fontSize: 14,
                                        color: const Color(0xFF9055FF)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10)
                          ]),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
