import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppHelperFunctions {
  static Future<String?> appDatePicker(BuildContext context,
      {DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
      bool isDateOnly = true,
      OverlayEntry? overlayEntry}) async {
    lastDate = lastDate ?? DateTime.now().add(const Duration(days: 365 * 10));
    firstDate = firstDate ?? DateTime(1900);
    initialDate = initialDate ?? DateTime.now();

    if (overlayEntry != null) {
      overlayEntry.remove();
    }

    var selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (selectedDate != null) {
      return isDateOnly
          ? selectedDate.toIso8601String().split("T")[0]
          : selectedDate.toIso8601String();
    } else {
      return null;
    }
  }

  static dateFormat(String? startDate) {
    try {
      if (startDate == null) {
        return "";
      }

      return DateFormat("dd/MM/yyyy").format(DateTime.parse(startDate));
    } on Exception catch (e) {
      debugPrint(e.toString());

      return "";
    }
  }
}

extension AmountGenerator on String {
  static String doubleToAmount(double value) {
    return "\u09F3 ${value.toStringAsFixed(1)}";
  }
}
