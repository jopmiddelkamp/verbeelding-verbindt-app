import 'dart:convert';

import 'package:flutter/foundation.dart';

extension StringExtensions on String {
  String toBase64() {
    var bytes = utf8.encode(this);
    var result = base64.encode(bytes);
    return result;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  T toEnum<T extends Object>(
    List<T> values,
  ) {
    return values.firstWhere(
      (v) => equalsIgnoreCase(describeEnum(v)),
    );
  }

  bool equals(
    String value,
  ) {
    return value == this;
  }

  bool equalsIgnoreCase(
    String value,
  ) {
    return value.toLowerCase() == toLowerCase();
  }
}
