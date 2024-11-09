class Validator {
  static bool isNullOrEmpty(Object value) {
    if (null == value) {
      return true;
    }

    if (value is String) {
      return value.trim().isEmpty;
    }

    if (value is List || value is Set) {
      return (value as List).isEmpty || (value as Set).isEmpty;
    }

    if (value is Map) {
      return value.isEmpty;
    }

    if (value is Enum) {
      return !(value as Iterable).iterator.moveNext();
    }

    if (value is Iterator) {
      return !(value as Iterable).iterator.moveNext();
    }

    return false;
  }

  static bool isNotNullOrEmpty(Object value) {
    return !isNullOrEmpty(value);
  }

  static bool isValidNumber(String number) {
    if (isNullOrEmpty(number)) return false;

    if (isNotNullOrEmpty(number)) {
      number = number.replaceAll(r'\.', '');
    }

    RegExp regex = RegExp(r'-?\d+(\.\d+)?');
    
    return regex.hasMatch(number);
  }
}
