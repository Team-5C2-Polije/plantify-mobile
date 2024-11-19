import 'dart:io';

import 'package:intl/intl.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';

class DateTimeConverter{

  static final DateFormat rfc1123Format = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz');

  static DateTime? parseRFC1123(String? dateString) {
    if (dateString == null) return null;
    try {
      return HttpDate.parse(dateString);
    } catch (e) {
      LogPrint.info('Failed to parse date: $e');
      return null;
    }
  }
}