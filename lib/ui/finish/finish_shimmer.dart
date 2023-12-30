//
//  finish_shimmer.dart
//  Created on 2023 30 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FinishShimmer extends StatelessWidget {
  const FinishShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: ListView(
              children: [
                // item
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.white,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                // item
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white),
              ],
            )),
      ),
      floatingActionButton: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.white,
                child: Image.asset('assets/icons/back_rtl.png',
                    color: Colors.white, width: 20),
                onPressed: () {}),
            const SizedBox(width: 10),
            const FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: null,
                label: Text(
                  "page 12",
                  style: TextStyle(
                      fontFamily: 'BTitr', fontSize: 16, color: Colors.white),
                )),
            const SizedBox(width: 10),
            FloatingActionButton(
                backgroundColor: Colors.white,
                child: Image.asset('assets/icons/back_ltr.png',
                    color: Colors.white, width: 20),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
