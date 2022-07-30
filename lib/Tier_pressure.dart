
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'font.dart';


class TierPressure extends StatefulWidget {
  String tname;
  double tpress;
  TierPressure({Key? key, required this.tname, required this.tpress}) : super(key: key);

  @override
  State<TierPressure> createState() => _TierPressureState();
}

class _TierPressureState extends State<TierPressure> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 200,
      child: Column(
        children: [
          Text('${widget.tname}',
            style: smallnormalfont,),
          Text(widget.tpress.toString() + ' PSI',style: smallnormalfont,),
          LinearPercentIndicator(
            width: 100.0,
            // fillColor: Colors.green,
            // linearGradient: LinearGradient(
            //   colors: [Colors.red,Colors.orangeAccent, Colors.green],
            //   stops: [0.3,0.7,1],
            //   transform:
            //
            // ),
            progressColor: widget.tpress/100 > 0.4 ? Colors.green : Colors.red,
            lineHeight: 14.0,
            alignment: MainAxisAlignment.center,
            animateFromLastPercent: true,
            animation: true,
            percent: widget.tpress/100,
            center: Text(
              widget.tpress.toString() + ' PSI',
              style: TextStyle(fontSize: 12.0),
            ),
            barRadius: Radius.circular(7),
            backgroundColor: Colors.grey,
          ),

        ],
      ),
    );
  }
}
