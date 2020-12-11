import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malayalajalakam/providers/file_manager.dart';
import 'package:provider/provider.dart';
import 'package:malayalajalakam/providers/unicode_manager.dart';
import '../providers/malayalam_manager.dart';
import '../widgets/normal_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _uniController;

  @override
  void initState() {
    _uniController = TextEditingController();
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
            children: [WorkArea(_uniController)],
          ),
        ),
      ),
    );
  }
}

class WorkArea extends StatelessWidget {
  final uniController;

  const WorkArea(this.uniController);
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
                    print(uniController.text);
                    malayalamManager.updateFmlText(uniController.text);
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
                      malayalamManager.updateFmlText(uniController.text);
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
                      malayalamManager.updateFmlText(uniController.text);
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
                    await Provider.of<FileManager>(context, listen: false)
                        .saveThisFileToSharedPref(uniController.text);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    var result =
                        await Provider.of<FileManager>(context, listen: false)
                            .reloadFile();
                    uniController.text = result;
                  },
                )
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.8,
            color: Colors.white,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: TextField(
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
            ),
          ),
        ],
      ),
    );
  }
}

// class RightSideArea extends StatelessWidget {
//   final TextEditingController uniController;

//   RightSideArea(this.uniController);

//   @override
//   Widget build(BuildContext context) {
//     final malayalamManager = Provider.of<MalayalamManager>(context);
//     return Container(
//       // width: MediaQuery.of(context).size.width * 0.16,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           NormalButton(
//             title: 'Show FML',
//             onPressed: () {
//               print('asdfasdf');
//               print(uniController.text);
//               malayalamManager.updateFmlText(uniController.text);
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return Container(
//                         width: MediaQuery.of(context).size.width * 0.5,
//                         child: AlertDialog(
//                           title: Container(
//                               width: MediaQuery.of(context).size.width * 0.5,
//                               child: Text('Converted FML Text')),
//                           content: TextField(
//                             maxLines: 20,
//                             minLines: 5,
//                             controller: TextEditingController(
//                                 text: malayalamManager.fmlTextContent),
//                             style: Theme.of(context).textTheme.headline1,
//                           ),
//                           actions: [
//                             NormalButton(
//                               title: 'Close me!',
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             )
//                           ],
//                         ));
//                   });
//             },
//           ),
//           NormalButton(
//             title: 'Copy to FML',
//             onPressed: () {
//               malayalamManager.updateFmlText(uniController.text);
//               Clipboard.setData(ClipboardData(
//                 text: malayalamManager.fmlTextContent,
//               ));
//             },
//           ),
//           NormalButton(
//             title: 'Copy to MLKV',
//             onPressed: () {
//               malayalamManager.updateFmlText(uniController.text);
//               Clipboard.setData(ClipboardData(
//                 text: malayalamManager.mlkvTextContent,
//               ));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
