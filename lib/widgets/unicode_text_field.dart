import 'package:flutter/material.dart';
import 'package:malayalajalakam/providers/unicode_manager.dart';
import 'package:provider/provider.dart';

class UnicodeTextField extends StatefulWidget {
  @override
  _UnicodeTextFieldState createState() => _UnicodeTextFieldState();
}

class _UnicodeTextFieldState extends State<UnicodeTextField> {
  TextEditingController uniController;

  @override
  void initState() {
    uniController = TextEditingController();
    super.initState();
  }

  void setFontSize(UnicodeManager unicodeManager) {
    unicodeManager.setFontSize();
  }

  @override
  Widget build(BuildContext context) {
    final UnicodeManager unicodeManager = Provider.of<UnicodeManager>(context);
    setFontSize(unicodeManager);
    return TextField(
      autofocus: true,
      onChanged: (value) {
        unicodeManager.updateUnicodeText(uniController);
      },
      controller: uniController,
      maxLines: 25,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        filled: true,
        fillColor: Colors.white70,
      ),
      readOnly: false,
      cursorColor: Colors.blue,
      style: Theme.of(context)
          .textTheme
          .headline2
          .copyWith(fontSize: unicodeManager.uniFontSize),
    );
  }
}
