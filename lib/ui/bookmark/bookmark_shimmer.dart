//
//  bookmark_shimmer.dart
//  Created on 2023 05 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookmarkShimmer extends StatefulWidget {
  const BookmarkShimmer({super.key});

  @override
  State<BookmarkShimmer> createState() => _BookmarkShimmerState();
}

class _BookmarkShimmerState extends State<BookmarkShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        body: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                // item
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
              ],
            )));
  }
}
