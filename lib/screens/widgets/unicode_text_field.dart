import 'package:flutter/material.dart';
import 'package:malayalajalakam/providers/unicode_manager.dart';
import 'package:provider/provider.dart';

class UnicodeTextField extends StatelessWidget {
  final TextEditingController uniController;

  UnicodeTextField(this.uniController);

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
        if (unicodeManager.isEngOn) {
        } else {
          unicodeManager.updateUnicodeText(uniController);
        }
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
      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: unicodeManager.uniFontSize),
    );
  }
}
