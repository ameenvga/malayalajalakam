import 'package:flutter/material.dart';
import '../widgets/top_tool_bar.dart';
import '../widgets/unicode_text_field.dart';
import 'package:provider/provider.dart';
import '../providers/unicode_manager.dart';
import '../providers/malayalam_manager.dart';

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
          TopToolBar(
              unicodeManager: unicodeManager,
              malayalamManager: malayalamManager),
          Container(
            height: screenHeight * 0.8,
            color: Colors.white,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: UnicodeTextField(),
          ),
          Text(
            'Developed by ameenvengara@gmail.com',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
