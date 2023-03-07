import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizer/models/colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme) {
    return ThemeData(
      // Nagłówek
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
        foregroundColor:
            isDarkTheme ? GetColors.darkMainFont : GetColors.lightMainFont,
      ),
      ////////////////////////////////////////////////////////////////////
      ///
      /// Przciski
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:
            isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
        foregroundColor:
            isDarkTheme ? GetColors.darkMainFont : GetColors.lightMainFont,
        hoverColor:
            isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          backgroundColor:
              isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
          foregroundColor:
              isDarkTheme ? GetColors.darkMainFont : GetColors.lightMainFont,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          foregroundColor:
              isDarkTheme ? GetColors.darkMainFont : GetColors.lightMainFont,
        ),
      ),
      ////////////////////////////////////////////////////////////////////
      ///
      /// tło dolengo menu - nieaktywne
      //canvasColor: isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
      ////////////////////////////////////////////////////////////////////
      ///
      /// Dolne menu
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'agency_fb',
            fontSize: 20,
            color: isDarkTheme ? GetColors.white : GetColors.gray),
        //backgroundColor:isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        selectedItemColor:
            isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
        unselectedItemColor:
            isDarkTheme ? GetColors.darkMainFont : GetColors.lightMainFont,
      ),

      ////////////////////////////////////////////////////////////////////
      ///
      /// style konkretnych stron
      scaffoldBackgroundColor:
          isDarkTheme ? GetColors.darkShades : GetColors.lightShades,
      ////////////////////////////////////////////////////////////////////
      ///
      /// styl tekstów - globalny
      textSelectionTheme: TextSelectionThemeData(
        cursorColor:
            isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
        selectionColor:
            isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
        selectionHandleColor:
            isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
      ),
/*
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: isDarkTheme
                  ? GetColors.darkMainFont
                  : GetColors.lightMainFont),
          bodyText2: TextStyle(
              color: isDarkTheme
                  ? GetColors.darkMainFont
                  : GetColors.lightMainFont),
          button: TextStyle(
              color: isDarkTheme
                  ? GetColors.darkMainFont
                  : GetColors.lightMainFont),
          subtitle1: TextStyle(
              color: isDarkTheme
                  ? GetColors.darkMainFont
                  : GetColors.lightMainFont),
          subtitle2: TextStyle(
              color: isDarkTheme
                  ? GetColors.darkMainFont
                  : GetColors.lightMainFont)),
      */
      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontWeight: FontWeight.bold,
              // fontSize: 100,
              fontFamily: 'agency_fb',
              color: isDarkTheme ? GetColors.white : GetColors.gray),
          bodyText2: TextStyle(
              fontWeight: FontWeight.bold,
              //  fontSize: 100,
              fontFamily: 'agency_fb',
              color: isDarkTheme ? GetColors.white : GetColors.gray),
          button: TextStyle(
              fontWeight: FontWeight.bold,
              //  fontSize: 100,
              fontFamily: 'agency_fb',
              color: isDarkTheme ? GetColors.white : GetColors.gray),
          subtitle1: TextStyle(
              fontWeight: FontWeight.bold,
              //  fontSize: 100,
              fontFamily: 'agency_fb',
              color: isDarkTheme ? GetColors.white : GetColors.gray),
          subtitle2: TextStyle(
              fontWeight: FontWeight.bold,
              //  fontSize: 100,
              fontFamily: 'agency_fb',
              color: isDarkTheme ? GetColors.white : GetColors.gray)),

      ////////////////////////////////////////////////////////////////////
      ///
      /// styl formularza

      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          color: GetColors.error,
        ),
        hintStyle: TextStyle(
          color: isDarkTheme ? GetColors.mainColorDark : GetColors.white,
        ),
        labelStyle: TextStyle(
          color: isDarkTheme ? GetColors.darkMainFont : GetColors.white,
        ),
        suffixIconColor: GetColors.error,
        // isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
        filled: true,
        fillColor: isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          //borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(width: 3, color: GetColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: isDarkTheme
                ? GetColors.mainColorDark
                : GetColors.mainColorLight,
            width: 2.0,
          ),
        ),
      ),

      ////////////////////////////////////////////////////////////////////
      ///
      /// styl listy
      cardTheme: CardTheme(
        color: isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
      ),
      ////////////////////////////////////////////////////////////////////
      ///
      /// styl listy rozwijanej
      canvasColor:
          isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
      ////////////////////////////////////////////////////////////////////
      ///
      /// styl suwaka
      sliderTheme: SliderThemeData(
        thumbColor:
            isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
        activeTrackColor:
            isDarkTheme ? GetColors.mainColorDark : GetColors.mainColorLight,
        inactiveTrackColor:
            isDarkTheme ? GetColors.darkAccent : GetColors.lightAccent,
      ),

      ////////////////////////////////////////////////////////////////////
      bottomAppBarTheme: BottomAppBarTheme(
        color: isDarkTheme ? GetColors.darkShades : GetColors.lightShades,
      ),
    );
  }
}
