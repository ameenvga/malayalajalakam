import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/file_manager.dart';
import '../providers/malayalam_manager.dart';
import '../providers/unicode_manager.dart';
import 'package:provider/provider.dart';

import 'normal_button.dart';

class TopToolBar extends StatelessWidget {
  TopToolBar({
    this.uniController,
    @required this.unicodeManager,
    @required this.malayalamManager,
  });

  final UnicodeManager unicodeManager;
  final MalayalamManager malayalamManager;
  final TextEditingController uniController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              unicodeManager.increaseFontSize();
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              unicodeManager.decreaseFontSize();
            },
          ),
          NormalButton(
            title: 'Show FML',
            onPressed: () {
              var text = unicodeManager.unicodeTextContent;
              malayalamManager.updateFmlText(text);
              showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: AlertDialog(
                          title: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text('Converted FML Text')),
                          content: TextField(
                            maxLines: 20,
                            minLines: 5,
                            controller: TextEditingController(
                                text: malayalamManager.fmlTextContent),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          actions: [
                            NormalButton(
                              title: 'Close me!',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));
                  });
            },
          ),
          NormalButton(
            title: '> FML',
            onPressed: () {
              try {
                var text = unicodeManager.unicodeTextContent;
                malayalamManager.updateFmlText(text);
                Clipboard.setData(ClipboardData(
                  text: malayalamManager.fmlTextContent,
                ));
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  'Successfully copied the FML version!',
                  textAlign: TextAlign.center,
                )));
              } on Exception catch (_) {
                print(_);
              }
            },
          ),
          NormalButton(
            title: '> MLKV',
            onPressed: () {
              try {
                var text = unicodeManager.unicodeTextContent;
                malayalamManager.updateFmlText(text);
                Clipboard.setData(ClipboardData(
                  text: malayalamManager.mlkvTextContent,
                ));
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  'Successfully copied the MLKV version!',
                  textAlign: TextAlign.center,
                )));
              } on Exception catch (_) {
                print(_);
              }
            },
          ),
          NormalButton(
            title: '> Unicode',
            onPressed: () {
              try {
                var text = uniController.text;
                Clipboard.setData(ClipboardData(
                  text: text,
                ));
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  'Successfully copied the Unicode text!',
                  textAlign: TextAlign.center,
                )));
              } on Exception catch (_) {
                print(_);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              var text = unicodeManager.unicodeTextContent;
              await Provider.of<FileManager>(context, listen: false)
                  .saveThisFileToSharedPref(text);
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              String text =
                  await Provider.of<FileManager>(context, listen: false)
                      .reloadFile();
              uniController.text = text;
            },
          ),
          SizedBox(width: 50),
          NormalButton(
            title: 'Clear',
            onPressed: () {
              try {
                uniController.text = '';
                unicodeManager.unicodeText = '';
              } on Exception catch (_) {
                print(_);
              }
            },
          ),
        ],
      ),
    );
  }
}
