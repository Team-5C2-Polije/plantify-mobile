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

  static String? toUpdatedAtStyle(DateTime? datetime) {
    if (datetime != null) {
      return '${datetime.year}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')} ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
    } else {
      return 'N/A';
    }
  }
}