import 'package:flutter/material.dart';
import 'package:malayalajalakam/screens/widgets/appbox.dart';
import 'package:provider/provider.dart';

import '../providers/malayalam_manager.dart';
import '../providers/unicode_manager.dart';
import 'widgets/top_tool_bar.dart';
import 'widgets/unicode_text_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isEngOn;
  @override
  void initState() {
    _isEngOn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      leading: Image.asset(
        'assets/images/appicon_purple.jpg',
        scale: 2,
      ),
      title: Text('മലയാള ജാലകം v1.1.3‌', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white)),
      actions: [
        Switch.adaptive(
          activeColor: Colors.amber,
          value: _isEngOn,
          onChanged: (value) {
            setState(() {
              _isEngOn = !_isEngOn;
              Provider.of<UnicodeManager>(context, listen: false).switchIsEngOn();
            });
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: WorkArea(),
    );
  }
}

class WorkArea extends StatefulWidget {
  @override
  _WorkAreaState createState() => _WorkAreaState();
}

class _WorkAreaState extends State<WorkArea> {
  final uniController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final unicodeManager = Provider.of<UnicodeManager>(context);
    final malayalamManager = Provider.of<MalayalamManager>(context, listen: false);
    return AppBox(
      widthP: 100,
      heightP: 100,
      minusAppBarHeight: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopToolBar(uniController: uniController, unicodeManager: unicodeManager, malayalamManager: malayalamManager),
          AppBox(
            // color: Color.fromARGB(255, 152, 137, 120),
            showColor: true,
            heightP: 100,
            minusAppBarHeight: true,
            hminusPx: 70,
            child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: UnicodeTextField(uniController)),
          ),
          AppBox(
            heightPx: 20,
            child: Text(
              'Developed by ameenvengara@gmail.com | www.malayalam-addon.blogspot.com for desktop version',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
