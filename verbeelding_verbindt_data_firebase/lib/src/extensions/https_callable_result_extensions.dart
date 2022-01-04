import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';

extension HttpsCallableResultX on HttpsCallableResult {
  /// Workaround because cloud functions don't return a map but an unaccessible
  /// _InternalLinkedHashMap<Object, Object?>
  dynamic get jsonData {
    final data = jsonEncode(this.data);
    return jsonDecode(data);
  }
}
