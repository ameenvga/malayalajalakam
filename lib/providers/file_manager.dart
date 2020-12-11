import 'package:flutter/cupertino.dart';
import 'package:malayalajalakam/providers/unicode_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this file deals with file management
class FileManager with ChangeNotifier {
  Future<void> saveThisFileToSharedPref(text) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('first', text);
    notifyListeners();
  }

  Future<void> reloadFile() async {
    final prefs = await SharedPreferences.getInstance();
    final text = prefs.getString('first') ?? 'No text available!';
    UnicodeManager().
  }
}
