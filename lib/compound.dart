import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CompoundIntrestCalculator extends StatefulWidget {
  CompoundIntrestCalculator({Key key}) : super(key: key);

  _CompoundIntrestCalculatorState createState() =>
      _CompoundIntrestCalculatorState();
}

class _CompoundIntrestCalculatorState extends State<CompoundIntrestCalculator> {
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
    initial= 0.0;
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

  final _bottomSheet = Container(
    height: 30,
    color: Colors.green,
    child: Center(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Inspect full result here: ",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.arrow_forward,
          size: 16,
          color: Colors.white,
        ),
        IconButton(
          icon: Icon(Icons.radio_button_checked),
          onPressed: () {},
          iconSize: 16,
          color: Colors.white,
        )
      ],
    )),
  );
  final vSpace = SizedBox(height: 2,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown[100],
        child: ListView(
          children: <Widget>[
            //TITLE TEXT
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                child: Center(
                  child: Text(
                    "COMPOUND INTEREST CALCULATOR ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                    maxLines: 1,
                  ),
                )),
            //IMAGE OF DOLLAR CIRCULAR
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image(
                      color: Colors.green,
                      image: AssetImage("assets/returnofi.png"),
                    )),
              ),
            ),
            //TEXTFIELD: INITIAL INVESTMENT
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  setState(() {
                    myControllerInitial.text = value;
                  });
                },
                controller: myControllerInitial,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Initial investment',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  //TEXTFIELD: ROI
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onSubmitted: (value) {
                        setState(() {
                          myControllerRoi.text = value;
                        });
                      },
                      controller: myControllerRoi,
                      decoration: InputDecoration(
                        suffix: Text("%"),
                        prefixIcon: Icon(Icons.all_inclusive),
                        border: OutlineInputBorder(),
                        labelText: 'ROI',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  //TEXTFIELD: COMPOUND TIMES
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,

                      onSubmitted: (value) {
                        setState(() {
                          myControllerCompound.text = value;
                        });
                      },
                      controller: myControllerCompound,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.show_chart),
                        border: OutlineInputBorder(),
                        labelText: 'Compound times',
                        labelStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //TEXTFIELD: MONTHLY
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  setState(() {
                    myControllerMonthly.text = value;
                  });
                },
                controller: myControllerMonthly,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.label,
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'additional cycle investment',
                ),
              ),
            ),
            //BUTTON: CALCULATE
            Padding(
              padding: const EdgeInsets.fromLTRB(122, 16, 122, 0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.green[400],
                ),
                label: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  setState(() {
                    isFirstTimeCycle = true;
                    toShow = calculateCompound(
                            double.parse(myControllerInitial.text),
                            double.parse(myControllerRoi.text),
                            double.parse(myControllerMonthly.text != null ? myControllerMonthly.text: 0 ),
                            double.parse(myControllerCompound.text))
                        .toStringAsFixed(2);

                    initial = double.parse(myControllerInitial.text);
                    roi = double.parse(myControllerRoi.text);
                    monthly = double.parse(myControllerMonthly.text != null ? myControllerMonthly.text: 0 );
                    compoundTimes = double.parse(myControllerCompound.text);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text("  You invested ${initial.toStringAsFixed(2)}  dollars",style: TextStyle(fontSize: 15, color: Colors.green)),
                vSpace,
                Text("  in a fund that yields ${roi.toStringAsFixed(1)} %  each cycle.",style: TextStyle(fontSize: 15, color: Colors.green)),
                vSpace,
                Text("  You invested an additional ${monthly.toStringAsFixed(2)} dollars each cycle.",style: TextStyle(fontSize: 15, color: Colors.green)),
                vSpace,
                Text("  After ${compoundTimes.toInt()} compound cycle( x times a year ),",style: TextStyle(fontSize: 15, color: Colors.green)),
                SizedBox(height: 12,),
                Center(child:Text("  your investment now worth:",style: TextStyle(fontSize: 17, color: Colors.green))),
              ],)  
              
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(toShow,
                        style: TextStyle(fontSize: 20, color: Colors.green)),
                    Icon(
                      Icons.attach_money,
                      color: Colors.green,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
