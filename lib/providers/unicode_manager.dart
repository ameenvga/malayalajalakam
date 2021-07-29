import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnicodeManager with ChangeNotifier {
  double _uniFontSize = 20;
  bool _isEngOn = false;

  bool get isEngOn => _isEngOn;

  void switchIsEngOn() {
    _isEngOn = !_isEngOn;
  }

  double get uniFontSize => _uniFontSize;

  void setFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    _uniFontSize = prefs.getDouble('fontSize') ?? 25;
    notifyListeners();
  }

  void increaseFontSize() async {
    _uniFontSize = _uniFontSize > 60 ? 60 : _uniFontSize + 2.0;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontSize', _uniFontSize);
    notifyListeners();
  }

  void decreaseFontSize() async {
    _uniFontSize = _uniFontSize < 18 ? 18 : _uniFontSize - 2.0;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontSize', _uniFontSize);
    notifyListeners();
  }

  Map<String, Map> uniReference = {
    'letters': {
      '~': "്",
      '-A': '-ാ',
      '-അa': '-ാ',
      "0": "0",
      "1": "1",
      "2": "2",
      "3": "3",
      "4": "4",
      "5": "5",
      "6": "6",
      "7": "7",
      "8": "8",
      "9": "9",
      "്a": "",
      "്e": "െ",
      "്i": "ി",
      "്o": "ൊ",
      "്u": "ു",
      "്A": "ാ",
      "്E": "േ",
      "്I": "ീ",
      "്O": "ോ",
      "്U": "ൂ",
      "്Y": "ൈ",
      "െe": "ീ",
      "ൊo": "ൂ",
      "ിi": "ീ",
      "ിe": "ീ",
      "ുu": "ൂ",
      "ുo": "ൂ",
      "്r": "്ര്",
      "്ര്R": "ൃ",
      "k": "ക്",
      "ക്a": "ക",
      "ക്h": "ഖ്",
      "g": "ഗ്",
      "ഗ്h": "ഘ്",
      "ൻg": "ങ്",
      "c": "ക്‍",
      "ക്‍h": "ച്",
      "ച്h": "ഛ്",
      "j": "ജ്",
      "ജ്h": "ഝ്",
      "ൻj": "ഞ്",
      "ൻh": "ഞ്",
      "T": "ട്",
      "ട്h": "ഠ്",
      "D": "ഡ്",
      "ഡ്h": "ഢ്",
      "റ്റ്h": "ത്",
      "ത്h": "ഥ്",
      "d": "ദ്",
      "ദ്h": "ധ്",
      "p": "പ്",
      "പ്h": "ഫ്",
      "f": "ഫ്",
      "b": "ബ്",
      "ബ്h": "ഭ്",
      "y": "യ്",
      "v": "വ്",
      "w": "വ്",
      "z": "ശ്",
      "S": "ശ്",
      "സ്h": "ഷ്",
      "s": "സ്",
      "h": "ഹ്",
      "ശ്h": "ഴ്",
      "x": "ക്ഷ്",
      "R": "റ്",
      "t": "റ്റ്",
      "N": "ൺ",
      "n": "ൻ",
      "m": "ം",
      "r": "ർ",
      "l": "ൽ",
      "L": "ൾ",
      "a": "അ",
      "അa": "ആ",
      "A": "ആ",
      "e": "എ",
      "E": "ഏ",
      "എe": "ഈ",
      "i": "ഇ",
      "ഇi": "ഈ",
      "ഇe": "ഈ",
      "അi": "ഐ",
      "I": "ഐ",
      "o": "ഒ",
      "ഒo": "ഊ",
      "O": "ഓ",
      "അu": "ഔ",
      "ഒu": "ഔ",
      "u": "ഉ",
      "ഉu": "ഊ",
      "U": "ഊ",
      "H": "ഃ",
      "ർr": "ഋ",
      "ഋr": "ൠ",
      "ൽ^": "ഌ",
      "ഌu": "ൡ",
      "ൻt": "ന്റ്",
      "ന്റ്h": "ന്ത്",
      "ൻk": "ങ്ക്",
      "ൻn": "ന്ന്",
      "ൺN": "ണ്ണ്",
      "ൾL": "ള്ള്",
      "ൽl": "ല്ല്",
      "ംm": "മ്മ്",
      "ൻm": "ന്മ്",
      "ന്ന്g": "ങ്ങ്",
      "ൻd": "ന്ദ്",
      "ൺm": "ണ്മ്",
      "ൽp": "ല്പ്",
      "ംp": "മ്പ്",
      "റ്റ്t": "ട്ട്",
      "ൻT": "ണ്ട്",
      "ൺT": "ണ്ട്",
      "ണ്T": "ണ്ട്",
      "്ര്r": "ൃ",
      "ൻc": "ൻ‍",
      "ൻ‍h": "ഞ്ച്",
      "ൺD": "ണ്ഡ്",
      "B": "ബ്ബ്",
      "C": "ക്ക്‍",
      "F": "ഫ്",
      "G": "ഗ്ഗ്",
      "J": "ജ്ജ്",
      "K": "ക്ക്",
      "M": "മ്മ്",
      "P": "പ്പ്",
      "Q": "ക്യൂ",
      "V": "വ്വ്",
      "W": "വ്വ്",
      "X": "ക്ഷ്",
      "Y": "യ്യ്",
      "Z": "ശ്ശ്",
      "്L": "്ല്",
      "്~": "്‌",
      "‌~": "‌",
      "ം~": "മ്‌",
      "ക്‍c": "ക്ക്‍",
      "ക്ക്‍h": "ച്ച്",
      "q": "ക്യൂ",
      "കa": "കാ",
      "കe": "കേ",
      "കi": "കൈ",
      "കo": "കോ",
      "കu": "കൗ",
      "ഖa": "ഖാ",
      "ഖe": "ഖേ",
      "ഖi": "ഖൈ",
      "ഖo": "ഖോ",
      "ഖu": "ഖൗ",
      "ഗa": "ഗാ",
      "ഗe": "ഗേ",
      "ഗi": "ഗൈ",
      "ഗo": "ഗോ",
      "ഗu": "ഗൗ",
      "ഘa": "ഘാ",
      "ഘe": "ഘേ",
      "ഘi": "ഘൈ",
      "ഘo": "ഘോ",
      "ഘu": "ഘൗ",
      "ങa": "ങാ",
      "ങe": "ങേ",
      "ങi": "ങൈ",
      "ങo": "ങോ",
      "ങu": "ങൗ",
      "ചa": "ചാ",
      "ചe": "ചേ",
      "ചi": "ചൈ",
      "ചo": "ചോ",
      "ചu": "ചൗ",
      "ഛa": "ഛാ",
      "ഛe": "ഛേ",
      "ഛi": "ഛൈ",
      "ഛo": "ഛോ",
      "ഛu": "ഛൗ",
      "ജa": "ജാ",
      "ജe": "ജേ",
      "ജi": "ജൈ",
      "ജo": "ജോ",
      "ജu": "ജൗ",
      "ഝa": "ഝാ",
      "ഝe": "ഝേ",
      "ഝi": "ഝൈ",
      "ഝo": "ഝോ",
      "ഝu": "ഝൗ",
      "ഞa": "ഞാ",
      "ഞe": "ഞേ",
      "ഞi": "ഞൈ",
      "ഞo": "ഞോ",
      "ഞu": "ഞൗ",
      "ടa": "ടാ",
      "ടe": "ടേ",
      "ടi": "ടൈ",
      "ടo": "ടോ",
      "ടu": "ടൗ",
      "ഠa": "ഠാ",
      "ഠe": "ഠേ",
      "ഠi": "ഠൈ",
      "ഠo": "ഠോ",
      "ഠu": "ഠൗ",
      "ഡa": "ഡാ",
      "ഡe": "ഡേ",
      "ഡi": "ഡൈ",
      "ഡo": "ഡോ",
      "ഡu": "ഡൗ",
      "ഢa": "ഢാ",
      "ഢe": "ഢേ",
      "ഢi": "ഢൈ",
      "ഢo": "ഢോ",
      "ഢu": "ഢൗ",
      "ണa": "ണാ",
      "ണe": "ണേ",
      "ണi": "ണൈ",
      "ണo": "ണോ",
      "ണu": "ണൗ",
      "തa": "താ",
      "തe": "തേ",
      "തi": "തൈ",
      "തo": "തോ",
      "തu": "തൗ",
      "ഥa": "ഥാ",
      "ഥe": "ഥേ",
      "ഥi": "ഥൈ",
      "ഥo": "ഥോ",
      "ഥu": "ഥൗ",
      "ദa": "ദാ",
      "ദe": "ദേ",
      "ദi": "ദൈ",
      "ദo": "ദോ",
      "ദu": "ദൗ",
      "ധa": "ധാ",
      "ധe": "ധേ",
      "ധi": "ധൈ",
      "ധo": "ധോ",
      "ധu": "ധൗ",
      "നa": "നാ",
      "നe": "നേ",
      "നi": "നൈ",
      "നo": "നോ",
      "നu": "നൗ",
      "പa": "പാ",
      "പe": "പേ",
      "പi": "പൈ",
      "പo": "പോ",
      "പu": "പൗ",
      "ഫa": "ഫാ",
      "ഫe": "ഫേ",
      "ഫi": "ഫൈ",
      "ഫo": "ഫോ",
      "ഫu": "ഫൗ",
      "ബa": "ബാ",
      "ബe": "ബേ",
      "ബi": "ബൈ",
      "ബo": "ബോ",
      "ബu": "ബൗ",
      "ഭa": "ഭാ",
      "ഭe": "ഭേ",
      "ഭi": "ഭൈ",
      "ഭo": "ഭോ",
      "ഭu": "ഭൗ",
      "മa": "മാ",
      "മe": "മേ",
      "മi": "മൈ",
      "മo": "മോ",
      "മu": "മൗ",
      "യa": "യാ",
      "യe": "യേ",
      "യi": "യൈ",
      "യo": "യോ",
      "യu": "യൗ",
      "രa": "രാ",
      "രe": "രേ",
      "രi": "രൈ",
      "രo": "രോ",
      "രu": "രൗ",
      "ലa": "ലാ",
      "ലe": "ലേ",
      "ലi": "ലൈ",
      "ലo": "ലോ",
      "ലu": "ലൗ",
      "വa": "വാ",
      "വe": "വേ",
      "വi": "വൈ",
      "വo": "വോ",
      "വu": "വൗ",
      "ശa": "ശാ",
      "ശe": "ശേ",
      "ശi": "ശൈ",
      "ശo": "ശോ",
      "ശu": "ശൗ",
      "ഷa": "ഷാ",
      "ഷe": "ഷേ",
      "ഷi": "ഷൈ",
      "ഷo": "ഷോ",
      "ഷu": "ഷൗ",
      "സa": "സാ",
      "സe": "സേ",
      "സi": "സൈ",
      "സo": "സോ",
      "സu": "സൗ",
      "ഹa": "ഹാ",
      "ഹe": "ഹേ",
      "ഹi": "ഹൈ",
      "ഹo": "ഹോ",
      "ഹu": "ഹൗ",
      "ളa": "ളാ",
      "ളe": "ളേ",
      "ളi": "ളൈ",
      "ളo": "ളോ",
      "ളu": "ളൗ",
      "ഴa": "ഴാ",
      "ഴe": "ഴേ",
      "ഴi": "ഴൈ",
      "ഴo": "ഴോ",
      "ഴu": "ഴൗ",
      "റa": "റാ",
      "റe": "റേ",
      "റi": "റൈ",
      "റo": "റോ",
      "റu": "റൗ",
      "റ്റa": "റ്റാ",
      "റ്റe": "റ്റേ",
      "റ്റi": "റ്റൈ",
      "റ്റo": "റ്റോ",
      "റ്റu": "റ്റൗ",
      "ൺa": "ണ",
      "ൺe": "ണെ",
      "ൺi": "ണി",
      "ൺo": "ണൊ",
      "ൺu": "ണു",
      "ൺA": "ണാ",
      "ൺE": "ണേ",
      "ൺI": "ണീ",
      "ൺO": "ണോ",
      "ൺU": "ണൂ",
      "ൺY": "ണൈ",
      "ൺr": "ണ്ര്",
      "ൺy": "ണ്യ്",
      "ൺw": "ണ്വ്",
      "ൺ~": "ണ്‌",
      "ൻa": "ന",
      "ൻe": "നെ",
      "ൻi": "നി",
      "ൻo": "നൊ",
      "ൻu": "നു",
      "ൻA": "നാ",
      "ൻE": "നേ",
      "ൻI": "നീ",
      "ൻO": "നോ",
      "ൻU": "നൂ",
      "ൻY": "നൈ",
      "ൻr": "ന്ര്",
      "ൻy": "ന്യ്",
      "ൻw": "ന്വ്",
      "ൻ~": "ന്‌",
      "ംa": "മ",
      "ംe": "മെ",
      "ംi": "മി",
      "ംo": "മൊ",
      "ംu": "മു",
      "ംA": "മാ",
      "ംE": "മേ",
      "ംI": "മീ",
      "ംO": "മോ",
      "ംU": "മൂ",
      "ംY": "മൈ",
      "ംr": "മ്ര്",
      "ംy": "മ്യ്",
      "ംw": "മ്വ്",
      "ർa": "ര",
      "ർe": "രെ",
      "ർi": "രി",
      "ർo": "രൊ",
      "ർu": "രു",
      "ർA": "രാ",
      "ർE": "രേ",
      "ർI": "രീ",
      "ർO": "രോ",
      "ർU": "രൂ",
      "ർY": "രൈ",
      "ർy": "ര്യ്",
      "ർw": "ര്വ്",
      "ർ~": "ര്‌",
      "ൽa": "ല",
      "ൽe": "ലെ",
      "ൽi": "ലി",
      "ൽo": "ലൊ",
      "ൽu": "ലു",
      "ൽA": "ലാ",
      "ൽE": "ലേ",
      "ൽI": "ലീ",
      "ൽO": "ലോ",
      "ൽU": "ലൂ",
      "ൽY": "ലൈ",
      "ൽr": "ല്ര്",
      "ൽy": "ല്യ്",
      "ൽw": "ല്വ്",
      "ൽ~": "ല്‌",
      "ൾa": "ള",
      "ൾe": "ളെ",
      "ൾi": "ളി",
      "ൾo": "ളൊ",
      "ൾu": "ളു",
      "ൾA": "ളാ",
      "ൾE": "ളേ",
      "ൾI": "ളീ",
      "ൾO": "ളോ",
      "ൾU": "ളൂ",
      "ൾY": "ളൈ",
      "ൾr": "ള്ര്",
      "ൾy": "ള്യ്",
      "ൾw": "ള്വ്",
      "ൾ~": "ള്‌",
      "്‍a": "",
      "്‍e": "െ",
      "്‍i": "ി",
      "്‍o": "ൊ",
      "്‍u": "ു",
      "്‍A": "ാ",
      "്‍E": "േ",
      "്‍I": "ീ",
      "്‍O": "ോ",
      "്‍U": "ൂ",
      "്‍Y": "ൈ",
      "്‍r": "്ര്",
      "്‍y": "്യ്",
      "്‍w": "്വ്",
      "്‍~": "്‌",
      "|": "‌",
      'ംL': 'മ്ല്',
      'ത്a': 'ത',
      'ഥ്a': 'ഥ',
      'ധ്a': 'ധ',
      'ഭ്a': 'ഭ',
      'ഷ്a': 'ഷ',
      'ഴ്a': 'ഴ',
      'ന്ത്a': 'ന്ത',
      'ത്ത്a': 'ത്ത',
      'ക്ത്a': 'ക്ത',
      'ല്ല്a': 'ല്ല',
      'ന്ന്a': 'ന്ന',
      'ണ്ണ്a': 'ണ്ണ',
      'ള്ള്a': 'ള്ള',
      'ന്മ്a': 'ന്മ',
      'ണ്മ്a': 'ണ്മ',
      " ": " ",
      'ബ്a': 'ബ',
      'ക്‍a': 'ക',
      'ദ്a': 'ദ',
      'ഫ്a': 'ഫ',
      'ഗ്a': 'ഗ',
      'ഹ്a': 'ഹ',
      'ജ്a': 'ജ',
      'പ്a': 'പ',
      'ഖ്a': 'ഖ',
      'സ്a': 'സ',
      'റ്റ്a': 'റ്റ',
      'വ്a': 'വ',
      'ക്ഷ്a': 'ക്ഷ',
      'യ്a': 'യ',
      'ശ്a': 'ശ',
      'ബ്ബ്a': 'ബ്ബ',
      'ക്ക്‍a': 'ക്ക',
      'ഡ്a': 'ഡ',
      'ഗ്ഗ്a': 'ഗ്ഗ',
      'ജ്ജ്a': 'ജ്ജ',
      'ക്ക്a': 'ക്ക',
      'മ്മ്a': 'മ്മ',
      'പ്പ്a': 'പ്പ',
      'റ്a': 'റ',
      'ട്a': 'ട',
      'വ്വ്a': 'വ്വ',
      'യ്യ്a': 'യ്യ',
      'ശ്ശ്a': 'ശ്ശ',
      'ഘ്a': 'ഘ',
      'ങ്a': 'ങ',
      'ച്a': 'ച',
      'ഛ്a': 'ഛ',
      'ഝ്a': 'ഝ',
      'ഞ്a': 'ഞ',
      'ഠ്a': 'ഠ',
      'ഢ്a': 'ഢ',
      "്ല്a": "്ല",
      'ക്ര്a': 'ക്ര',
      'ഖ്ര്a': 'ഖ്ര',
      'ഗ്ര്a': 'ഗ്ര',
      'ഘ്ര്a': 'ഘ്ര',
      'ങ്ര്a': 'ങ്ര',
      'ച്ര്a': 'ച്ര',
      'ഛ്ര്a': 'ഛ്ര',
      'ജ്ര്a': 'ജ്ര',
      'ഝ്ര്a': 'ഝ്ര',
      'ഞ്ര്a': 'ഞ്ര',
      'ട്ര്a': 'ട്ര',
      'ഠ്ര്a': 'ഠ്ര',
      'ഡ്ര്a': 'ഡ്ര',
      'ഢ്ര്a': 'ഢ്ര',
      'ണ്ര്a': 'ണ്ര',
      'ത്ര്a': 'ത്ര',
      'ഥ്ര്a': 'ഥ്ര',
      'ദ്ര്a': 'ദ്ര',
      'ധ്ര്a': 'ധ്ര',
      'ന്ര്a': 'ന്ര',
      'പ്ര്a': 'പ്ര',
      'ഫ്ര്a': 'ഫ്ര',
      'ബ്ര്a': 'ബ്ര',
      'ഭ്ര്a': 'ഭ്ര',
      'മ്ര്a': 'മ്ര',
      'ല്ര്a': 'ല്ര',
      'വ്ര്a': 'വ്ര',
      'ശ്ര്a': 'ശ്ര',
      'ഷ്ര്a': 'ഷ്ര',
      'സ്ര്a': 'സ്ര',
      'ഹ്ര്a': 'ഹ്ര',
      'ള്ര്a': 'ള്ര',
      '=': '=',
      '+': '+',
      '{': '{',
      '}': '}',
      ';': ';',
      ':': ':',
      '"': '"',
      "'": "'",
      '<': '<',
      '/': '/',
      '_': '_',
      ']': ']',
      '[': '[',
      '\\': '\\',
      '^': '^',
      '`': '`'
    },
  };

  String _unicodeText = '';

  String getUnicodeText() {
    notifyListeners();
    return _unicodeText;
  }

  set unicodeText(String txt) {
    _unicodeText = txt;
    notifyListeners();
  }

  String get unicodeTextContent => _unicodeText;

  String replaceRange(
      String originalText, int start, int end, String replText) {
    String firstPart = originalText.substring(0, start) + replText;
    String lastPart = originalText.substring(end);
    if (lastPart.startsWith("‌")) {
      return firstPart + lastPart;
    }
    // else {
    //   lastPart = "‌" + originalText.substring(end);
    // }
    return firstPart +
        // "‌" + //adding an invisible break
        originalText.substring(end);
  }

  void updateUnicodeText(TextEditingController unicodeController) {
    print('updateUnicodeText');
    print('---------START---------');

    //get the whole text and get the current caret position
    _unicodeText = unicodeController.text;
    int caretPos = unicodeController.selection.baseOffset;
    int newCaretPos; //using to get the later position
    print('starting pos >>> ' + caretPos.toString());
    //select the last five letters and search for the combination
    for (var i = 5; i > 0; i--) {
      print(" >> for loop <<");
      try {
        var searchLetter = _unicodeText.substring(caretPos - i, caretPos);
        // print(unicodeText.substring(caretPos - i, caretPos));
        //if found a combination remove that much letters from the string and..
        if (uniReference['letters'].containsKey(searchLetter)) {
          String resultLetter = uniReference['letters'][searchLetter];
          _unicodeText =
              replaceRange(_unicodeText, caretPos - i, caretPos, resultLetter);
          // unicodeText =
          //     unicodeText.replaceAll("‌", ""); //removing all invisible break
          //getting the new caret position
          newCaretPos = caretPos - i + resultLetter.length;
          print('Caret pos>>> ' + newCaretPos.toString());
          unicodeController.selection = TextSelection(
              baseOffset: newCaretPos,
              extentOffset: newCaretPos,
              affinity: TextAffinity.downstream);
        }
      } catch (e) {}
    }

    try {
      print(" >> second try block <<");
      if (newCaretPos != null) {
        print('New Caret pos>>> ' + newCaretPos.toString());
        unicodeController.value = unicodeController.value.copyWith(
          text: _unicodeText,
          composing: TextRange.empty,
          selection: TextSelection(
              baseOffset: newCaretPos,
              extentOffset: newCaretPos,
              affinity: TextAffinity.downstream),
        );
      }
    } on Exception catch (e) {
      print(e);
    }
    print('---------END---------');
  }
}
