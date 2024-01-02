//
//  verse_item.dart
//  Created on 2023 06 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/widgets/widget_size.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VerseItem extends StatefulWidget {
  final String? surahName;
  final int? juzNumber;
  final int surahNumber;
  final int verseNumber;
  final String arabicText;
  final String translation;
  final bool isSaved;
  final Function(bool isSaved) onSaveTap;
  final Function() onShare;
  final Function() onVisible;
  final Function(double height) onHeight;

  const VerseItem({
    super.key,
    this.surahName,
    this.juzNumber,
    required this.surahNumber,
    required this.verseNumber,
    required this.arabicText,
    required this.translation,
    required this.isSaved,
    required this.onSaveTap,
    required this.onShare,
    required this.onVisible,
    required this.onHeight,
  });

  @override
  State<VerseItem> createState() => _VerseItemState();
}

class _VerseItemState extends State<VerseItem> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.surahNumber}-${widget.verseNumber}'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage == 100) {
          widget.onVisible();
        }
      },
      child: WidgetSize(
        onChange: (Size? size) => widget.onHeight(size?.height ?? 0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // toolbar
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.juzNumber == null
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(134, 62, 213, 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 30,
                          height: 50,
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "${'juz'.tr(context)} ${widget.juzNumber}",
                                style: TextStyle(
                                    fontFamily: SeratFont.bTitr.name,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(25, 49, 13, 0.071),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(134, 62, 213, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    widget.verseNumber.toString(),
                                    style: TextStyle(
                                        fontFamily: SeratFont.bTitr.name,
                                        fontSize: 14,
                                        color: Colors.white),
                                  )),
                                ),
                                const SizedBox(width: 10),
                                widget.surahName == null
                                    ? Container()
                                    : Text(widget.surahName!,
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                134, 62, 213, 1),
                                            fontFamily: SeratFont.amiri.name,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20))
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: widget.onShare,
                                      child: SizedBox(
                                        width: 25,
                                        child: Image.asset(SeratIcon.share.name,
                                            color: const Color(0xFF863ED5)),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSaved = !isSaved;
                                          widget.onSaveTap(!isSaved);
                                        });
                                      },
                                      child: isSaved
                                          ? Image.asset(SeratIcon.saved.name,
                                              color: const Color(0xFF863ED5))
                                          : Image.asset(SeratIcon.save.name,
                                              color: const Color(0xFF863ED5)))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              // text section
              Text(
                widget.arabicText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: const Color(0xFF240F4F),
                    fontFamily: SeratFont.quranTaha.name,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    height: 2),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              Text(widget.translation,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: const Color(0xFF240F4F),
                      fontFamily: SeratFont.bZar.name,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 2)),

              SizedBox(height: MediaQuery.of(context).size.height * .02),
              const Divider(
                height: 5,
                color: Color.fromRGBO(187, 196, 206, 0.35),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
            ],
          ),
        ),
      ),
    );
  }
}
