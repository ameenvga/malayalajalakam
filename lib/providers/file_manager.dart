import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this file deals with file management
class FileManager with ChangeNotifier {
  Future<void> saveThisFileToSharedPref(text) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('first', text);
    notifyListeners();
  }

  Future<String> reloadFile() async {
    final prefs = await SharedPreferences.getInstance();
    final text = prefs.getString('first') ?? 'No text available!';
    notifyListeners();
    return text;
  }
}
