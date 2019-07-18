import 'package:compound_intrest_calculator/cardItem.dart';
import 'package:compound_intrest_calculator/customColors.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Layout();
}

class _Layout extends State<Layout> {
  double calculateCompound(double investment, double roi, double monthlyInvest,
      double timesCompounded) {
    double value = investment;
    for (int i = 0; i < timesCompounded; i++) {
      value += ((value * roi) / 100);
      value += isFirstTimeCycle == true ? 0 : monthlyInvest;
      isFirstTimeCycle = false;
    }
    return value;
  }

  bool isFirstTimeCycle;

  final myControllerInitial = TextEditingController();
  final myControllerRoi = TextEditingController();
  final myControllerCompound = TextEditingController();
  final myControllerMonthly = TextEditingController();

  String toShow = "";

  double initial;
  double roi;
  double compoundTimes;
  double monthly;

  @override
  void initState() {
    super.initState();
    isFirstTimeCycle = true;
    initial = 0.0;
    roi = 0.0;
    monthly = 0.0;
    compoundTimes = 0.0;
    myControllerMonthly.text = "0";
  }

  @override
  void dispose() {
    myControllerInitial.dispose();
    myControllerRoi.dispose();
    myControllerCompound.dispose();
    myControllerMonthly.dispose();
    super.dispose();
  }

  TextField customTextField(TextEditingController controller, String label,
      {String suffix = ""}) {
    return TextField(
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      onSubmitted: (value) {
        setState(() {
          controller.text = value;
        });
      },
      controller: controller,
      decoration: InputDecoration(
          suffix: Text(suffix),
          filled: true,
          fillColor: Colors.black26,
          labelText: label,
          labelStyle: TextStyle(color: Colors.white,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 367,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(32.0),
                    bottomRight: const Radius.circular(32.0)),
                gradient: LinearGradient(
                    colors: [CustomColors.aquaGreen, CustomColors.cyan],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
            child: Column(
              children: <Widget>[
                //IMAGE
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                  child: Center(
                    child: Image(
                      width: 187,
                      height: 56,
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),
                //TEXFIELD INITIAL
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: customTextField(
                      myControllerInitial, "Initial Investment"),
                ),
                //TEXFIELDS ROW
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Row(
                    children: <Widget>[
                      //TEXTFIELD: ROI
                      Expanded(
                          child: customTextField(myControllerRoi, "ROI",
                              suffix: "%")),
                      SizedBox(
                        width: 12,
                      ),
                      //TEXTFIELD: COMPOUND TIMES
                      Expanded(
                          child: customTextField(
                              myControllerCompound, "Compound Times")),
                    ],
                  ),
                ),

                //TEXTFIELD: MONTHLY
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: customTextField(myControllerMonthly, "Additional")),
              ],
            ),
          ),
          //ROWWWWWWWWW 1
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardItem(label: "Invested",),
                SizedBox(
                  width: 5,
                ),
                CardItem(label: "ROI",),
              ],
            ),
          ),
          //ROWWWWWWWWW 2
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 420, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardItem(label: "Calla",),
                SizedBox(
                  width: 5,
                ),
                CardItem(label:"cazza"),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            child:SizedBox(width: 100,height: 100, child:Card(child: Text("CIAONE"),),),) ,
          //BUTTON
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 600, 0, 0),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: RaisedButton(
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                    color: Colors.cyan,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
