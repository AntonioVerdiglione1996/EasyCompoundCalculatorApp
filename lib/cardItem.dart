import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  String label;
  String pathIcon;
  double labelFontSize;
  String symbol;

  double valueToDisplay;
  double width;
  bool isYear;

  CardItem(
      {this.label,
      this.pathIcon,
      this.labelFontSize = 16,
      this.valueToDisplay,
      this.symbol = "",
      this.width = 181,
      this.isYear = false});
  @override
  State<StatefulWidget> createState() => _CardItem();
}

class _CardItem extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        width: widget.width,
        height: 85,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              left: 12,
              child: Text(
                widget.label,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: widget.labelFontSize,
                    letterSpacing: 0.25,
                    height: 0.8),
                maxLines: 2,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Image(
                image: AssetImage(widget.pathIcon),
              ),
              width: 30,
              height: 30,
            ),
            Positioned(
                top: 50,
                left: 12,
                child: Text(
                  !widget.isYear
                      ? widget.valueToDisplay.toStringAsFixed(2) +
                          " ${widget.symbol}"
                      : widget.valueToDisplay.toStringAsFixed(0),
                  style: TextStyle(color: Colors.grey[800], fontSize: 19),
                )),
          ],
        ),
      ),
    );
  }
}
