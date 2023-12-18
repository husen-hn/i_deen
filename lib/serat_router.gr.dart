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
    QuranReadingRoute.name: (routeData) {
      final args = routeData.argsAs<QuranReadingRouteArgs>(
          orElse: () => const QuranReadingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuranReading(
          key: args.key,
          pageNumber: args.pageNumber,
          surahNumber: args.surahNumber,
          verseNumber: args.verseNumber,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Splash(),
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
/// [QuranReading]
class QuranReadingRoute extends PageRouteInfo<QuranReadingRouteArgs> {
  QuranReadingRoute({
    Key? key,
    int? pageNumber,
    int? surahNumber,
    int? verseNumber,
    List<PageRouteInfo>? children,
  }) : super(
          QuranReadingRoute.name,
          args: QuranReadingRouteArgs(
            key: key,
            pageNumber: pageNumber,
            surahNumber: surahNumber,
            verseNumber: verseNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'QuranReadingRoute';

  static const PageInfo<QuranReadingRouteArgs> page =
      PageInfo<QuranReadingRouteArgs>(name);
}

class QuranReadingRouteArgs {
  const QuranReadingRouteArgs({
    this.key,
    this.pageNumber,
    this.surahNumber,
    this.verseNumber,
  });

  final Key? key;

  final int? pageNumber;

  final int? surahNumber;

  final int? verseNumber;

  @override
  String toString() {
    return 'QuranReadingRouteArgs{key: $key, pageNumber: $pageNumber, surahNumber: $surahNumber, verseNumber: $verseNumber}';
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
