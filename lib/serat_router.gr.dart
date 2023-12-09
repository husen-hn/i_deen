// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'serat_router.dart';

abstract class _$SeratRouter extends RootStackRouter {
  // ignore: unused_element
  _$SeratRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutUs(),
      );
    },
    BookmarkReadingRoute.name: (routeData) {
      final args = routeData.argsAs<BookmarkReadingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookmarkReading(
          key: args.key,
          appRepository: args.appRepository,
          surahNumber: args.surahNumber,
          verseNumber: args.verseNumber,
        ),
      );
    },
    CopyRightRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CopyRight(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Home(),
      );
    },
    JuzReadingRoute.name: (routeData) {
      final args = routeData.argsAs<JuzReadingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JuzReading(
          key: args.key,
          juzNumber: args.juzNumber,
        ),
      );
    },
    PageReadingRoute.name: (routeData) {
      final args = routeData.argsAs<PageReadingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PageReading(
          key: args.key,
          surahNumber: args.surahNumber,
          surahVerseNumber: args.surahVerseNumber,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Splash(),
      );
    },
    VersesReadingRoute.name: (routeData) {
      final args = routeData.argsAs<VersesReadingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VersesReading(
          key: args.key,
          surahNumber: args.surahNumber,
          surahName: args.surahName,
          surahEnglishName: args.surahEnglishName,
          surahType: args.surahType,
          versesCount: args.versesCount,
          verses: args.verses,
        ),
      );
    },
  };
}

/// generated route for
/// [AboutUs]
class AboutUsRoute extends PageRouteInfo<void> {
  const AboutUsRoute({List<PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookmarkReading]
class BookmarkReadingRoute extends PageRouteInfo<BookmarkReadingRouteArgs> {
  BookmarkReadingRoute({
    Key? key,
    required AppRepository appRepository,
    required int surahNumber,
    required int verseNumber,
    List<PageRouteInfo>? children,
  }) : super(
          BookmarkReadingRoute.name,
          args: BookmarkReadingRouteArgs(
            key: key,
            appRepository: appRepository,
            surahNumber: surahNumber,
            verseNumber: verseNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'BookmarkReadingRoute';

  static const PageInfo<BookmarkReadingRouteArgs> page =
      PageInfo<BookmarkReadingRouteArgs>(name);
}

class BookmarkReadingRouteArgs {
  const BookmarkReadingRouteArgs({
    this.key,
    required this.appRepository,
    required this.surahNumber,
    required this.verseNumber,
  });

  final Key? key;

  final AppRepository appRepository;

  final int surahNumber;

  final int verseNumber;

  @override
  String toString() {
    return 'BookmarkReadingRouteArgs{key: $key, appRepository: $appRepository, surahNumber: $surahNumber, verseNumber: $verseNumber}';
  }
}

/// generated route for
/// [CopyRight]
class CopyRightRoute extends PageRouteInfo<void> {
  const CopyRightRoute({List<PageRouteInfo>? children})
      : super(
          CopyRightRoute.name,
          initialChildren: children,
        );

  static const String name = 'CopyRightRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Home]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JuzReading]
class JuzReadingRoute extends PageRouteInfo<JuzReadingRouteArgs> {
  JuzReadingRoute({
    Key? key,
    required int juzNumber,
    List<PageRouteInfo>? children,
  }) : super(
          JuzReadingRoute.name,
          args: JuzReadingRouteArgs(
            key: key,
            juzNumber: juzNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'JuzReadingRoute';

  static const PageInfo<JuzReadingRouteArgs> page =
      PageInfo<JuzReadingRouteArgs>(name);
}

class JuzReadingRouteArgs {
  const JuzReadingRouteArgs({
    this.key,
    required this.juzNumber,
  });

  final Key? key;

  final int juzNumber;

  @override
  String toString() {
    return 'JuzReadingRouteArgs{key: $key, juzNumber: $juzNumber}';
  }
}

/// generated route for
/// [PageReading]
class PageReadingRoute extends PageRouteInfo<PageReadingRouteArgs> {
  PageReadingRoute({
    Key? key,
    required int surahNumber,
    required int surahVerseNumber,
    List<PageRouteInfo>? children,
  }) : super(
          PageReadingRoute.name,
          args: PageReadingRouteArgs(
            key: key,
            surahNumber: surahNumber,
            surahVerseNumber: surahVerseNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'PageReadingRoute';

  static const PageInfo<PageReadingRouteArgs> page =
      PageInfo<PageReadingRouteArgs>(name);
}

class PageReadingRouteArgs {
  const PageReadingRouteArgs({
    this.key,
    required this.surahNumber,
    required this.surahVerseNumber,
  });

  final Key? key;

  final int surahNumber;

  final int surahVerseNumber;

  @override
  String toString() {
    return 'PageReadingRouteArgs{key: $key, surahNumber: $surahNumber, surahVerseNumber: $surahVerseNumber}';
  }
}

/// generated route for
/// [Splash]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VersesReading]
class VersesReadingRoute extends PageRouteInfo<VersesReadingRouteArgs> {
  VersesReadingRoute({
    Key? key,
    required int surahNumber,
    required String surahName,
    required String surahEnglishName,
    required String surahType,
    required int versesCount,
    required List<int>? verses,
    List<PageRouteInfo>? children,
  }) : super(
          VersesReadingRoute.name,
          args: VersesReadingRouteArgs(
            key: key,
            surahNumber: surahNumber,
            surahName: surahName,
            surahEnglishName: surahEnglishName,
            surahType: surahType,
            versesCount: versesCount,
            verses: verses,
          ),
          initialChildren: children,
        );

  static const String name = 'VersesReadingRoute';

  static const PageInfo<VersesReadingRouteArgs> page =
      PageInfo<VersesReadingRouteArgs>(name);
}

class VersesReadingRouteArgs {
  const VersesReadingRouteArgs({
    this.key,
    required this.surahNumber,
    required this.surahName,
    required this.surahEnglishName,
    required this.surahType,
    required this.versesCount,
    required this.verses,
  });

  final Key? key;

  final int surahNumber;

  final String surahName;

  final String surahEnglishName;

  final String surahType;

  final int versesCount;

  final List<int>? verses;

  @override
  String toString() {
    return 'VersesReadingRouteArgs{key: $key, surahNumber: $surahNumber, surahName: $surahName, surahEnglishName: $surahEnglishName, surahType: $surahType, versesCount: $versesCount, verses: $verses}';
  }
}
