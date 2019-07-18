import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  String label;
  String pathIcon;

  CardItem({this.label,this.pathIcon ="assets/returnofi.png"});
  @override
  State<StatefulWidget> createState() => _CardItem();
}

class _CardItem extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: 15,
        child: SizedBox(
          width: 181,
          height: 80,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 45, 0),
                    child: Text(
                      widget.label,
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    child: Image(image: AssetImage(widget.pathIcon),color: Colors.purpleAccent,),
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 45, 0),
                      child: Text(
                        "00",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
