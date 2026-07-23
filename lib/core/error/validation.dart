

final class Validation {
  Validation._();

  static String? validateEmpty(dynamic value, {required String emptyMessage}) {
    if (value == null || value.isEmpty) {
      return emptyMessage;
    }
    return null;
  }
}
