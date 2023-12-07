import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/radio.dart';
import 'package:flutter_application_1/utils/ai_util.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<MyRadio> radios;
  
  fetchRadios()async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
  }


  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(children: [
        VxAnimatedBox()
            .size(context.screenWidth, context.screenHeight)
            .withGradient(LinearGradient(
                colors: [AIUtil.primaryColor1, AIUtil.primaryColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight))
            .make(),
        AppBar(
          title: 'Rima Music'.text.xl4.bold.white.make().shimmer(
              primaryColor: Vx.purple200, secondaryColor: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ).h(95).p(16)
      ]),
    );
  }
}
