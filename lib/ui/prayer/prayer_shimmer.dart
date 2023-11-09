import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PrayerShimmer extends StatelessWidget {
  const PrayerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 130,
              color: Colors.white,
            ),
            // article
            Container(
              margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            // article
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: double.infinity,
              height: 5,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
