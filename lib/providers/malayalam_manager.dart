import 'package:flutter/material.dart';

class MalayalamManager with ChangeNotifier {
  Map<String, Map> fmlReference = {
    'vowels': {
      'അ': 'A',
      'ആ': 'B',
      'ഇ': 'C',
      'ഈ': 'Cu',
      'ഉ': 'D',
      'ഊ': 'Du',
      'ഋ': 'E',
      'എ': 'F',
      'ഏ': 'G',
      'ഐ': 'sF',
      'ഒ': 'H',
      'ഓ': 'Hm',
      'ഔ': 'Hu',
      'ഃ': 'x',
      'ം': 'w',
    },
    'vowelsSymbolsRight': {
      'ാ': 'm',
      'ി': 'n',
      'ീ': 'o',
      'ു': 'p',
      'ൂ': 'q',
      'ൃ': 'r',
      'ൗ': 'u',
      'ം': 'w',
      'ഃ': 'x',
    },
    'consonants': {
      'ക': 'I',
      'ഖ': 'J',
      'ഗ': 'K',
      'ഘ': 'L',
      'ങ': 'M',
      'ച': 'N',
      'ഛ': 'O',
      'ജ': 'P',
      'ഝ': 'Q',
      'ഞ': 'R',
      'ട': 'S',
      'ഠ': 'T',
      'ഡ': 'U',
      'ഢ': 'V',
      'ണ': 'W',
      'ത': 'X',
      'ഥ': 'Y',
      'ദ': 'Z',
      'ധ': '[',
      'ന': '\\',
      'പ': ']',
      'ഫ': '^',
      'ബ': '_',
      'ഭ': '`',
      'മ': 'a',
      'യ': 'b',
      'ര': 'c',
      'ല': 'e',
      'വ': 'h',
      'ശ': 'i',
      'ഷ': 'j',
      'സ': 'k',
      'ഹ': 'l',
      'ള': 'f',
      'ഴ': 'g',
      'റ': 'd',
      'ർ': 'À',
      'ൻ': '³',
      'ൾ': 'Ä',
      'ൽ': 'Â',
      'ൺ': '¬',
    },
    'chills': {
      'cv': 'À',
      '\\v': '³',
      'Wv': '¬',
      'ev': 'Â',
      'fv': 'Ä',
    },
    'koottaksharam': {
      'Ivക': '¡',
      'Ivഷ': '£',
      'Ivല': '¢',
      'Kvന': 'á',
      'Kvമ': 'Ü',
      'Kvഗ': '¤',
      'Kvല': '¥',
      'Mvങ': '§',
      'Mvക': '¦',
      'Nvഛ': 'Ñ',
      'Pvഞ': 'Ú',
      'Pvജ': 'Ö',
      'Rvജ': 'RvP',
      'Rvഞ': 'ª',
      'Rvച': '©',
      'Svട': '«',
      'Uvഡ': 'Í',
      'Uvഢ': 'UvV',
      'Wvണ': '®',
      'Wvഡ': 'Þ',
      'Wvമ': '×',
      'Wvട': 'ï',
      'bvയ': '¿',
      'evല': 'Ã',
      'hvവ': 'Æ',
      'Xvമ': 'ß',
      'Xvത': '¯',
      'Xvഥ': '°',
      'Xvന': 'Xv',
      'Xvഭ': 'Û',
      'Xvസ': 'Õ',
      'Zvദ': '±',
      'Zvധ': '²',
      '\\vന': '¶',
      '\\vധ': 'Ô',
      '\\vദ': 'µ',
      '\\vഥ': 'Ù',
      '\\vമ': '·',
      '\\vത': '´',
      'avപ': '¼',
      '³vറ': '³vd',
      'ivച': 'Ý',
      'ivശ': 'È',
      // 'kvറ': 'kvä',
      'kvഥ': 'Ø',
      'kvല': 'É',
      'kvസ': 'Ê',
      'lvന': 'Ó',
      'lvമ': 'Ò',
      ']vപ': '¸',
      ']vല': '¹',
      '^vല': '^ve',
      '_vബ': 'º',
      '_vല': '»',
      'avമ': '½',
      'fvള': 'Å',
      'dvറ': 'ä',
      'Nvച': '¨',
    },
    'twoLetterConsonants': {
      'യ': 'y',
      'വ': 'z',
    },
    'praLetter': {
      'ര': '{',
    },
    'vowelsSymbolsAround': {
      'ൊ': 's',
      'ോ': 't',
    },
    'vowelsSymbolsLeft': {
      'െ': 's',
      'േ': 't',
      'ൈ': 'ss',
    }
  };

  String _fmlText = '';
  String _mlkvOut = '';
  String get fmlTextContent => _fmlText;
  String get mlkvTextContent {
    _mlkvOut = _fmlText.replaceAll('ï', '@');
    return _mlkvOut;
  }

  void updateFmlText(String unicodeMalayalam) {
    print('---updateFmlText--');
    _fmlText = '';
    String _lastLetter;
    for (var i = 0; i < unicodeMalayalam.length; i++) {
      String resultLetter;
//
      if (fmlReference['vowels'].containsKey(unicodeMalayalam[i])) {
        resultLetter = fmlReference['vowels'][unicodeMalayalam[i]];
        _fmlText = _fmlText + resultLetter;
        _lastLetter = resultLetter;
        // //print("---_lastLetter : " + _lastLetter);
//
      } else if (fmlReference['vowelsSymbolsRight']
          .containsKey(unicodeMalayalam[i])) {
        resultLetter = fmlReference['vowelsSymbolsRight'][unicodeMalayalam[i]];
        _fmlText = _fmlText + resultLetter;
        _lastLetter = _lastLetter + resultLetter;
        // //print("---_lastLetter : " + _lastLetter);
//
      } else if (fmlReference['vowelsSymbolsLeft']
          .containsKey(unicodeMalayalam[i])) {
        resultLetter = fmlReference['vowelsSymbolsLeft'][unicodeMalayalam[i]];
        _fmlText = removeNcharacters(_lastLetter.length, _fmlText);
        _fmlText = _fmlText + resultLetter + _lastLetter;

//
      } else if (fmlReference['vowelsSymbolsAround']
          .containsKey(unicodeMalayalam[i])) {
        resultLetter = fmlReference['vowelsSymbolsAround'][unicodeMalayalam[i]];
        _fmlText = removeNcharacters(_lastLetter.length, _fmlText);
        //adding left vowel symbol + letter + deergham
        _fmlText = _fmlText + resultLetter + _lastLetter + 'm';

//
      } else if (fmlReference['consonants'].containsKey(unicodeMalayalam[i])) {
        resultLetter = fmlReference['consonants'][unicodeMalayalam[i]];
        _fmlText = _fmlText + resultLetter;
        _lastLetter = resultLetter;
        // //print("---_lastLetter : " + _lastLetter);
        //
      } else if (unicodeMalayalam[i] == '്') {
        //print('in chandrakkala testing');
        //print(_lastLetter + 'v' + unicodeMalayalam[i + 1]);
        try {
          // checking nte combination
          if (_lastLetter == '\\' && unicodeMalayalam[i + 1] == 'റ') {
            resultLetter = 'â'; // ന്റ
            _fmlText = removeNcharacters(_lastLetter.length, _fmlText);
            _fmlText = _fmlText + resultLetter;
            _lastLetter = resultLetter;
            i++;
          }
          // got a chandrakkala from sentence?
          //Checking whether it makes a kootaksharam
          //if available, remove the last letter, and replace the letter from koottaksharam
          else if (fmlReference['koottaksharam']
              .containsKey(_lastLetter + 'v' + unicodeMalayalam[i + 1])) {
            //print('in koottaksharam testing');
            resultLetter = fmlReference['koottaksharam']
                [_lastLetter + 'v' + unicodeMalayalam[i + 1]];
            //print('ResultLetter is: ' + resultLetter);
            _fmlText = removeNcharacters(_lastLetter.length, _fmlText);
            _fmlText = _fmlText + resultLetter;
            _lastLetter = resultLetter;
            //print('LastLetter is: ' + _lastLetter);
            i = i + 1;
          }
          //check whether it makes the last letter, kya or kwa by checking the next letter
          // and increase the value of i
          else if (fmlReference['twoLetterConsonants']
              .containsKey(unicodeMalayalam[i + 1])) {
            resultLetter =
                fmlReference['twoLetterConsonants'][unicodeMalayalam[i + 1]];
            _fmlText = _fmlText + resultLetter;
            _lastLetter = _lastLetter + resultLetter;
            i++;
          } else if (fmlReference['praLetter']
              .containsKey(unicodeMalayalam[i + 1])) {
            resultLetter = fmlReference['praLetter'][unicodeMalayalam[i + 1]];
            _fmlText = removeNcharacters(_lastLetter.length, _fmlText);
            _fmlText = _fmlText + resultLetter + _lastLetter;
            _lastLetter = resultLetter + _lastLetter;
            i++;
          } else {
            //else put a chandrakkala and thats it!
            resultLetter = 'v';
            _fmlText = _fmlText + resultLetter;
            _lastLetter = _lastLetter + resultLetter;
          }
        } catch (e) {}
      } else if (unicodeMalayalam[i].codeUnits[0] == 8205) {
        //found a chill end, and searching for the last two letter combination
        if (fmlReference['chills'].containsKey(_lastLetter)) {
          _fmlText = removeNcharacters(_lastLetter.length, _fmlText);
          _fmlText = _fmlText + fmlReference['chills'][_lastLetter];
        }
        //
      } else {
        _fmlText = _fmlText + unicodeMalayalam[i];
      }
    }
    notifyListeners();
  }
}

String removeNcharacters(int n, String text) {
  if (text != null && text.length >= n) {
    text = text.substring(0, text.length - n);
    return text;
  }

  return 'nothing';
}
