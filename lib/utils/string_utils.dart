extension TestRegExp on String {
  bool isValidRegex() {
    try {
      RegExp(this);
      return true;
    } catch (e) {
      if (e is FormatException) {
        return false;
      }
      rethrow; // unexpected error
    }
  }
}
