//
//  articles_shimmer.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesShimmer extends StatelessWidget {
  const ArticlesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // article
              Container(
                margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
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
      ),
    );
  }
}
