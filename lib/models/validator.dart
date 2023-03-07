import 'package:flutter/material.dart';

class Validator {
  static String? validateEmail(String value, BuildContext context) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePasswordRegister(
      String value, String nextpass, BuildContext context) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Password must be at least 6 characters.';
    } else if (value != nextpass) {
      return '🚩 Passwords must be the same.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value, BuildContext context) {
    //Pattern pattern = r'^.{6,}$';
    Pattern pattern = r'^.{4,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  static String? validateVeryficationCode(String value, BuildContext context) {
    //Pattern pattern = r'^.{6,}$';
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 The verification code must be 6 characters long.';
    } else {
      return null;
    }
  }

  static String? validateName(String value, BuildContext context) {
    if (value.length < 3) {
      return '🚩 Username is too short.';
    } else {
      return null;
    }
  }

  static String? validateText(String value, BuildContext context) {
    if (value.isEmpty) {
      return '🚩 The field must not be empty.';
    } else {
      return null;
    }
  }

  static String? validatePrice(String value, BuildContext context) {
    Pattern pattern = r'(^\d*\.?\d*)$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return '🚩 The field must not be empty.';
    } else if (!regex.hasMatch(value)) {
      return '🚩 Enter the correct price.';
    } else {
      return null;
    }
  }

  static String? validateDouble(String value, BuildContext context) {
    Pattern pattern = r'^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return '🚩 The field must not be empty.';
    } else if (!regex.hasMatch(value)) {
      return '🚩 Enter the correct float number.';
    } else {
      return null;
    }
  }

  static String? validateInt(String value, BuildContext context) {
    Pattern pattern = r'^[-+]?[0-9]+$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return '🚩 The field must not be empty.';
    } else if (!regex.hasMatch(value)) {
      return '🚩 Enter the correct integer number.';
    } else {
      return null;
    }
  }

  static String? validateCoordinatesLatitude(
      String value, BuildContext context) {
    Pattern pattern = r'^-?([0-8]?[0-9]|90)(\.[0-9]{1,10})$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return '🚩 The field must not be empty.';
    } else if (!regex.hasMatch(value)) {
      return '🚩 Enter the correct coordinates.';
    } else {
      return null;
    }
  }

  static String? validateCoordinatesLongitude(
      String value, BuildContext context) {
    Pattern pattern = r'^-?([0-9]{1,2}|1[0-7][0-9]|180)(\.[0-9]{1,10})$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return '🚩 The field must not be empty.';
    } else if (!regex.hasMatch(value)) {
      return '🚩 Enter the correct coordinates.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value, BuildContext context) {
    if (value.length < 9) {
      return '🚩 Phone number is not valid.';
    } else {
      return null;
    }
  }
}
