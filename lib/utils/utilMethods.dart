import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class UtilMethods {
  static StreamTransformer transformer<T>(
          T Function(Map<String, dynamic> map) fromMap) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
          handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
        final snaps = data.docs.map((doc) => doc.data()).toList();
        final objects = snaps.map((map) => fromMap(map)).toList();

        sink.add(objects);
      });
}
