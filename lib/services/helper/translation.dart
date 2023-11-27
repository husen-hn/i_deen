enum Translation { makarem }

extension CatExtension on Translation {
  String? get name {
    switch (this) {
      case Translation.makarem:
        return 'tr/fa/makarem/source.json';

      default:
        return null;
    }
  }
}
