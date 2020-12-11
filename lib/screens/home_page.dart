import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/file_manager.dart';
import '../widgets/unicode_text_field.dart';
import 'package:provider/provider.dart';
import '../providers/unicode_manager.dart';
import '../providers/malayalam_manager.dart';
import '../widgets/normal_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        title: Text('MalayalaJalakam'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.black12,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [WorkArea()],
          ),
        ),
      ),
    );
  }
}

class WorkArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final unicodeManager = Provider.of<UnicodeManager>(context);
    final malayalamManager =
        Provider.of<MalayalamManager>(context, listen: false);
    return Container(
      width: screenWidth > 1600 ? 1600 : screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
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
                    await Provider.of<FileManager>(context, listen: false)
                        .reloadFile();
                  },
                )
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.8,
            color: Colors.white,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: UnicodeTextField(),
          ),
        ],
      ),
    );
  }
}
