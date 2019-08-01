import 'package:EasyCompound/adMobHelper.dart';
import 'package:EasyCompound/cardItem.dart';
import 'package:EasyCompound/customColors.dart';
import 'package:flutter/material.dart';
import 'raisedGradientButton.dart';

class TestLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestLayout();
}

class _TestLayout extends State<TestLayout> {
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
      onTap: () {
        controller.clear();
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
          contentPadding: EdgeInsets.all(16),
          labelStyle: TextStyle(
            color: Colors.white,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          //BLU COVER ROUNDED
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
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
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
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
                                  myControllerCompoundTimes, "Years")),
                        ],
                      ),
                    ),

                    //TEXTFIELD: Re invested moiney
                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                        child: customTextField(
                            myControllerAdditional, "Re-Invested each year ",
                            suffix: "+ each year")),
                  ],
                ),
              ),

              //BUTTON HERE
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
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
                      FocusScope.of(context).requestFocus(new FocusNode());

                      if (myControllerAdditional.text == "") {
                        setState(() {
                          myControllerAdditional.text = "0";
                        });
                      }
                      isFirstTimeCycle = true;
                      initialInvestment =
                          double.parse(myControllerInitialInvestment.text);
                      roi = double.parse(myControllerRoi.text);
                      compoundTimes =
                          double.parse(myControllerCompoundTimes.text);
                      additional = double.parse(myControllerAdditional.text);
                      finalValue = calculateCompound(
                          initialInvestment, roi, additional, compoundTimes);
                    });
                  },
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.white]),
                ),
              ),

              //RESULTS TEXT
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Text(
                    "Results",
                    style: TextStyle(
                        color: CustomColors.blue_sky,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0.25),
                  ),
                ),
              ),

              //CARDS ROW 1
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //double.parse(myControllerInitialInvestment.text)
                  Expanded(
                    child: CardItem(
                      label: "Invested:",
                      pathIcon: "assets/invested_icon.png",
                      symbol: r"$",
                      valueToDisplay: initialInvestment,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //double.parse(myControllerRoi.text)
                  Expanded(
                    child: CardItem(
                      label: "ROI:",
                      pathIcon: "assets/roi_icon.png",
                      symbol: r"%",
                      valueToDisplay: roi,
                    ),
                  ),
                ],
              ),
              //CARDS ROW 2
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //double.parse(myControllerInitialInvestment.text)
                  Expanded(
                    child: CardItem(
                      label: "Added \neach year:",
                      pathIcon: "assets/Additional_icon.png",
                      symbol: r"$",
                      valueToDisplay: additional,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //double.parse(myControllerRoi.text)
                  Expanded(
                    child: CardItem(
                      label: "Years:",
                      pathIcon: "assets/cycle.png",
                      valueToDisplay: compoundTimes,
                      isYear: true,
                    ),
                  ),
                ],
              ),
              //bigcard
              CardItem(
                  label: "Your investment is now worth:",
                  pathIcon: "assets/finalvalue.png",
                  symbol: r"$",
                  valueToDisplay: finalValue,
                  width: 400),
              //spacer
              Container(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
