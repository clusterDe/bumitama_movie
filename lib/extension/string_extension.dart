import 'package:intl/intl.dart';

extension StringExtension on String {
  String get clearAllPadSpace {
    if (isEmpty) {
      return "";
    }
    final pattern = RegExp('\\s+');
    return trim().replaceAll(pattern, " ");
  }

  String get clearPadSpace {
    if (isEmpty) {
      return "";
    }
    return trim().split("\n").map((e) => e.clearAllPadSpace).join("\n");
  }

  bool get isNumeric {
    return double.tryParse(toString()) != null;
  }

  String get currencyFormat {
    num number = 0.0;
    if (clearAllPadSpace.isNumeric) {
      number = double.parse(clearPadSpace);
    }
    final format = NumberFormat('#,###.00').format(number);
    return format;
  }
}
