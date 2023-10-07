import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/malayalam_manager.dart';
import '../providers/unicode_manager.dart';
import '../widgets/top_tool_bar.dart';
import '../widgets/unicode_text_field.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          padding: EdgeInsets.all(10.0),
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [WorkArea()],
          ),
        ),
      ),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final unicodeManager = Provider.of<UnicodeManager>(context);
    final malayalamManager = Provider.of<MalayalamManager>(context, listen: false);
    return Container(
      width: screenWidth > 1600 ? 1600 : screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopToolBar(uniController: uniController, unicodeManager: unicodeManager, malayalamManager: malayalamManager),
          Container(
            height: screenHeight * 0.8,
            color: Colors.white,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: UnicodeTextField(uniController),
          ),
          Text(
            'Developed by ameenvengara@gmail.com | www.malayalam-addon.blogspot.com for desktop version',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
