// //
// //  page_reading.dart
// //  Created on 2023 11 November.
// //  Copyright © IDeen Flutter application,
// //  Developed by 2023 Hossein HassanNejad.
// //

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:i_deen/controller/quran/quran_cubit.dart';
// import 'package:i_deen/services/l10n/app_local.dart';
// import 'package:i_deen/widgets/ayah_item.dart';

// class PageReading extends StatelessWidget {
//   final String title;
//   final List<int>? verses;

//   const PageReading({
//     super.key,
//     required this.title,
//     required this.verses,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [
//       BlocProvider<QuranCubit>(create: (BuildContext context) => QuranCubit())
//     ], child: PageReadingView(title: title, verses: verses));
//   }
// }

// class PageReadingView extends StatelessWidget {
//   final String title;
//   final List<int>? verses;

//   const PageReadingView({
//     super.key,
//     required this.title,
//     required this.verses,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             title,
//             style: const TextStyle(
//                 fontFamily: 'Amiri', fontWeight: FontWeight.w900, fontSize: 20),
//           ),
//           shadowColor: Colors.transparent,
//           leading: GestureDetector(
//             child: Image.asset('assets/icons/back_rtl.png'),
//             onTap: () => context.pop(),
//           ),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           physics: const BouncingScrollPhysics(),
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * .5,
//               height: MediaQuery.of(context).size.height * .4,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 gradient: const LinearGradient(
//                     colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
//                 boxShadow: [
//                   BoxShadow(
//                       color: const Color(0xFF9055FF).withOpacity(0.2),
//                       spreadRadius: 3,
//                       blurRadius: 10,
//                       offset: const Offset(0, 20))
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: -30,
//                     bottom: -50,
//                     child: Image.asset(
//                       'assets/namaz_logo.png',
//                       opacity: const AlwaysStoppedAnimation(.2),
//                       width: MediaQuery.of(context).size.width * .7,
//                     ),
//                   ),
//                   Text(
//                     title,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Amiri',
//                         fontWeight: FontWeight.w800,
//                         fontSize: 30),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             // BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
//             //   if (state.status == QuranStatus.verses) {
//             //     return ListView.builder(
//             //         shrinkWrap: true,
//             //         physics: const NeverScrollableScrollPhysics(),
//             //         itemCount: state.verses!.length,
//             //         itemBuilder: (context, index) {
//             //           return AyahItem(
//             //               surahName: surahName,
//             //               // display index for verses number on full surah, and display verses number on limited surah
//             //               ayahNumber:
//             //                   verses == null ? index + 1 : verses![index],
//             //               arabicText: state.verses![index],
//             //               translation: 'translation');
//             //         });
//             //   } else {
//             //     return Container();
//             //   }
//             // })
//           ],
//         ));
//   }
// }
