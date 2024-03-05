//
//  settings.dart
//  Created on 2023 28 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/person_schema.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/services/helper/serat_list_name.dart';
import 'package:serat/widgets/radio_horizon_list.dart';

@RoutePage(name: 'SettingsRoute')
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    List<PersonSchema> tr = [
      PersonSchema(
          id: 0,
          name: SeratListName.ansarian.name,
          img: SeratListName.ansarian.img),
      PersonSchema(
          id: 1, name: SeratListName.ayati.name, img: SeratListName.ayati.img),
      PersonSchema(
          id: 2,
          name: SeratListName.bahrampour.name,
          img: SeratListName.bahrampour.img),
      PersonSchema(
          id: 3,
          name: SeratListName.fooladvand.name,
          img: SeratListName.fooladvand.img),
      PersonSchema(
          id: 4,
          name: SeratListName.ghomshei.name,
          img: SeratListName.ghomshei.img),
      PersonSchema(
          id: 5,
          name: SeratListName.khorramdel.name,
          img: SeratListName.khorramdel.img),
      PersonSchema(
          id: 6,
          name: SeratListName.khorramshahi.name,
          img: SeratListName.khorramshahi.img),
      PersonSchema(
          id: 7,
          name: SeratListName.makarem.name,
          img: SeratListName.makarem.img),
      PersonSchema(
          id: 8,
          name: SeratListName.moezzi.name,
          img: SeratListName.moezzi.img),
      PersonSchema(
          id: 9,
          name: SeratListName.mojtabavi.name,
          img: SeratListName.mojtabavi.img),
    ];

    List<PersonSchema> theme = [
      PersonSchema(
          id: 0, name: SeratListName.light.name, img: SeratListName.light.img),
      PersonSchema(
          id: 1,
          name: SeratListName.nokhodi.name,
          img: SeratListName.nokhodi.img),
      PersonSchema(
          id: 2,
          name: SeratListName.batele.name,
          img: SeratListName.batele.img),
      PersonSchema(
          id: 3, name: SeratListName.dark.name, img: SeratListName.dark.img)
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
          title: const Text(
            'تنظیمات',
            style: TextStyle(
                fontFamily: 'BZar', fontWeight: FontWeight.w900, fontSize: 20),
          ),
          shadowColor: Colors.transparent,
          leading: IconButton(
              icon: Image.asset(
                SeratIcon.backRTL.name,
                height: 16,
                color: const Color.fromRGBO(135, 137, 163, 1),
              ),
              onPressed: () {
                context.router.pop();
              })),
      body: Stack(
        children: [
          Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'مترجم',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: SeratFont.bZar.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: RadioHorizonList(
                        items: tr, onTap: (PersonSchema person) {}),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'قاری',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: SeratFont.bZar.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 160,
                      child: RadioHorizonList(
                          items: tr, onTap: (PersonSchema person) {})),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'تم',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: SeratFont.bZar.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 160,
                      child: RadioHorizonList(
                          items: theme, onTap: (PersonSchema person) {})),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.withOpacity(0.8),
            child: const Center(
                child: Text(
              'بزودی...',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }
}
