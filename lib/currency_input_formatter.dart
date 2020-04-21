import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    //Remove all non number characters
    String newText = newValue.text.replaceAll(RegExp(r'\D*'), '');

    //Trim leading zeros
    while (newText[0] == '0' && newText.length > 1) {
      newText = newText.substring(1);
    }

    //Add leading zeros
    while (newText.length < 3) {
      newText = '0' + newText;
    }

    //TODO use NumberFormatter instead
    //Add currency symbol and decimal separator
    newText = '\$' +
        newText.substring(0, newText.length - 2) +
        '.' +
        newText.substring(newText.length - 2);

    return newValue.copyWith(
      text: newText,
      selection: new TextSelection.collapsed(offset: newText.length),
    );
  }
}