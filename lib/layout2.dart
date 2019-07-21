import 'package:compound_intrest_calculator/adMobHelper.dart';
import 'package:compound_intrest_calculator/cardItem.dart';
import 'package:compound_intrest_calculator/customColors.dart';
import 'package:flutter/material.dart';

import 'raisedGradientButton.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Layout2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Layout2();
}

class _Layout2 extends State<Layout2> {
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

  double initialInvestment;
  double roi;
  double compoundTimes;
  double additional;
  double finalValue;

  bool isFirstTimeCycle;

  final myControllerInitialInvestment = TextEditingController();
  final myControllerRoi = TextEditingController();
  final myControllerCompoundTimes = TextEditingController();
  final myControllerAdditional = TextEditingController();

  @override
  void initState() {
    isFirstTimeCycle = true;
    initialInvestment = 0.0;
    roi = 0.0;
    additional = 0.0;
    compoundTimes = 0.0;
    finalValue = 0.0;
    AdMobHelper.initStateAd();

    super.initState();
  }

  @override
  void dispose() {
    myControllerInitialInvestment.dispose();
    myControllerRoi.dispose();
    myControllerCompoundTimes.dispose();
    myControllerAdditional.dispose();
    AdMobHelper.disposeMyAd();
    super.dispose();
  }

  TextField customTextField(TextEditingController controller, String label,
      {String suffix = ""}) {
    return TextField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0.25),
      keyboardType: TextInputType.number,
      onSubmitted: (value) {
        setState(() {
          controller.text = value;
        });
      },
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffix: Text(
            suffix,
            style: TextStyle(color: Colors.white),
          ),
          filled: true,
          fillColor: Colors.black26,
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    print( "Width:" + MediaQuery.of(context).size.width.toString());
    print("height:" +MediaQuery.of(context).size.height.toString());
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          //BLU COVER ROUNDED
          Container(
            width: double.infinity,
            height: 305,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(32.0),
                    bottomRight: const Radius.circular(32.0)),
                gradient: LinearGradient(
                    colors: [CustomColors.aquaGreen, CustomColors.cyan],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
          ),
          //ICON + TEXTFIELDS
          Column(
            children: <Widget>[
              //IMAGE
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
                child: Center(
                  child: Image(
                    width: 128,
                    height: 35,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
              //TEXFIELD INITIAL
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: customTextField(
                    myControllerInitialInvestment, "Initial Investment",
                    suffix: r"$"),
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
                            myControllerCompoundTimes, "cycles",suffix: "year")),
                  ],
                ),
              ),

              //TEXTFIELD: MONTHLY
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: customTextField(myControllerAdditional, "Additional for each cycle")),
            ],
          ),
          //BUTTON
          Positioned(
            top: 280,
            left: 112,
            right: 112,
            child: RaisedGradientButton(
              child: Text(
                "Calculate",
                style: TextStyle(
                    color: CustomColors.blue_sky,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.25),
              ),
              onPressed: () {
                setState(() {
                  if (myControllerAdditional.text == "") {
                    setState(() {
                      myControllerAdditional.text = "0";
                    });
                  }
                  isFirstTimeCycle = true;
                  initialInvestment =
                      double.parse(myControllerInitialInvestment.text);
                  roi = double.parse(myControllerRoi.text);
                  compoundTimes = double.parse(myControllerCompoundTimes.text);
                  additional = double.parse(myControllerAdditional.text);
                  finalValue = calculateCompound(
                      initialInvestment, roi, additional, compoundTimes);
                });
              },
              gradient: LinearGradient(colors: [Colors.white, Colors.white]),
            ),
          ),
          
          //RESULTS TEXT
          Positioned(
            top: 330,
            left: 25,
            child: Text(
              "Results",
              style: TextStyle(
                  color: CustomColors.blue_sky,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 0.25),
            ),
          ),
          //CARDS ROW 1
          Positioned(
            top: 345,
            left: 7.5,
            right: 7.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //double.parse(myControllerInitialInvestment.text)
                CardItem(
                  label: "Invested",
                  pathIcon: "assets/invested_icon.png",
                  symbol: r"$",
                  valueToDisplay: initialInvestment,
                ),
                SizedBox(
                  width: 5,
                ),
                //double.parse(myControllerRoi.text)
                CardItem(
                  label: "ROI",
                  pathIcon: "assets/roi_icon.png",
                  symbol: r"%",
                  valueToDisplay: roi,
                ),
              ],
            ),
          ),
          //CARDS ROW 2
          Positioned(
            top: 440,
            left: 7.5,
            right: 7.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //double.parse(myControllerAdditional.text)
                CardItem(
                  label: "Additional",
                  pathIcon: "assets/Additional_icon.png",
                  symbol: r"$",
                  valueToDisplay: additional,
                ),
                SizedBox(
                  width: 5,
                ),
                // double.parse(myControllerCompoundTimes.text)
                CardItem(
                  label: "Compound \nCycle",
                  pathIcon: "assets/cycle.png",
                  valueToDisplay: compoundTimes,
                ),
              ],
            ),
          ),
          //BIG CARD
          Positioned(
            top: 540,
            left: 15,
            right: 15,
            child: CardItem(
                label: "Final Value",
                pathIcon: "assets/finalvalue.png",
                symbol: r"$",
                valueToDisplay: finalValue,
                width: 400),
          ),
        ],
      ),
    );
  }
}
