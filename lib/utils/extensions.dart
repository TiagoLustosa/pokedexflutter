extension StringUtil on String {
  String toFirstUpperCase() {
    return substring(0, 1).toUpperCase() + substring(1);
  }
}
