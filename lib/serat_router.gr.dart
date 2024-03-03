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
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Home(
          appRepository: args.appRepository,
          key: args.key,
        ),
      );
    },
    QuranReadingRoute.name: (routeData) {
      final args = routeData.argsAs<QuranReadingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuranReading(
          key: args.key,
          appRepository: args.appRepository,
          pageNumber: args.pageNumber,
          surahNumber: args.surahNumber,
          verseNumber: args.verseNumber,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Settings(),
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
/// [Home]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required AppRepository appRepository,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            appRepository: appRepository,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.appRepository,
    this.key,
  });

  final AppRepository appRepository;

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{appRepository: $appRepository, key: $key}';
  }
}

/// generated route for
/// [QuranReading]
class QuranReadingRoute extends PageRouteInfo<QuranReadingRouteArgs> {
  QuranReadingRoute({
    Key? key,
    required AppRepository appRepository,
    int? pageNumber,
    int? surahNumber,
    int? verseNumber,
    List<PageRouteInfo>? children,
  }) : super(
          QuranReadingRoute.name,
          args: QuranReadingRouteArgs(
            key: key,
            appRepository: appRepository,
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
    required this.appRepository,
    this.pageNumber,
    this.surahNumber,
    this.verseNumber,
  });

  final Key? key;

  final AppRepository appRepository;

  final int? pageNumber;

  final int? surahNumber;

  final int? verseNumber;

  @override
  String toString() {
    return 'QuranReadingRouteArgs{key: $key, appRepository: $appRepository, pageNumber: $pageNumber, surahNumber: $surahNumber, verseNumber: $verseNumber}';
  }
}

/// generated route for
/// [Settings]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
