enum SeratTranslation { original, makarem }

extension SeratExtension on SeratTranslation {
  String? get name {
    switch (this) {
      case SeratTranslation.original:
        return 'tr/original/source.json';
      case SeratTranslation.makarem:
        return 'tr/fa/makarem/source.json';

      default:
        return null;
    }
  }
}
