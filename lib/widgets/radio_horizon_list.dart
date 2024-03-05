//
//  radio_horizon_list.dart
//  Created on 2024 04 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/person_schema.dart';
import 'package:serat/services/helper/serat_font.dart';

class RadioHorizonList extends StatefulWidget {
  final List<PersonSchema> items;
  final Function(PersonSchema person) onTap;
  const RadioHorizonList({super.key, required this.items, required this.onTap});

  @override
  State<RadioHorizonList> createState() => _RadioHorizonListState();
}

class _RadioHorizonListState extends State<RadioHorizonList> {
  int activeItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) => _cRadioItem(
                activeItemIndex == index,
                widget.items[index].name,
                widget.items[index].img, () {
              setState(() {
                activeItemIndex = index;
                widget.onTap(widget.items[index]);
              });
            }));
  }
}

Widget _cRadioItem(bool isActive, String name, String img, Function() onTap) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: isActive
                ? [const Color(0xFF9055FF), const Color(0xFFDF98FA)]
                : [
                    const Color.fromARGB(255, 180, 180, 180),
                    const Color.fromARGB(255, 255, 255, 255)
                  ],
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? const Color(0xFF9055FF).withOpacity(0.2)
                  : const Color.fromARGB(255, 180, 180, 180).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  img,
                  height: 70.0,
                  width: 70.0,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: SeratFont.bZar.name, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
