import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  String label;
  String pathIcon;
  double labelFontSize;
  String symbol;

  double valueToDisplay;
  double width;

  CardItem({this.label, this.pathIcon,this.labelFontSize=18,this.valueToDisplay,this.symbol="",this.width=181});
  @override
  State<StatefulWidget> createState() => _CardItem();
}

class _CardItem extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
        elevation: 15,
        child: SizedBox(
          width: widget.width,
          height: 90,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                left: 12,
                child: Text(
                  widget.label,
                  style: TextStyle(color: Colors.grey, fontSize: widget.labelFontSize,height:0.8),
                  maxLines: 2,
                ),
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Image(
                  image: AssetImage(widget.pathIcon),
                ),
                width: 30,
                height: 30,
              ),
              Positioned(
                  top: 46,
                  left: 12,
                  child: Text(
                    widget.valueToDisplay.toStringAsFixed(2) + " ${widget.symbol}",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )),
            ],
          ),
        ));
  }
}
