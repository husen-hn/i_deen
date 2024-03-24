//
//  articles_thumbnail.dart
//  Created on 2024 23 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:serat/services/helper/serat_font.dart';

class ArticleThumbnail extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final Function() onTap;
  const ArticleThumbnail(
      {super.key,
      required this.img,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 30),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      img,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .3,
                            color: Colors.grey,
                            child: const Center(
                                child: Icon(Icons.image_outlined,
                                    color: Colors.white, size: 20)));
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Html(data: title, style: {
                      "*": Style(
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          fontFamily: SeratFont.bTitr.name,
                          fontSize: FontSize.large,
                          fontWeight: FontWeight.bold),
                    })),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Html(data: description, style: {
                      "*": Style(
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                        color: const Color(0xFF240F4F),
                        fontFamily: SeratFont.bZar.name,
                        fontSize: FontSize.large,
                      ),
                    }))
              ],
            ),
          ),
        ));
  }
}
