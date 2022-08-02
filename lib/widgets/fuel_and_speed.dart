import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../font.dart';

class SpeedAndFuel extends StatelessWidget {
  double fuel;
  double speed;
  SpeedAndFuel({Key? key, required this.fuel, required this.speed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: 60,
            percent: fuel / 100,
            lineWidth: 20,
            // linearGradient: LinearGradient(colors: [Colors.redAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.lightGreenAccent],
            // stops: [0.1,0.3,0.6,1],
            //   begin: Alignment(1,0),
            //   end: Alignment(0,1),
            // ),
            backgroundColor: Colors.lightBlue.shade100,
            progressColor: fuel < 25
                ? Colors.redAccent
                : fuel < 50
                    ? Colors.orange
                    : Colors.green,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              fuel.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white54,
              ),
            ),
            footer: const Text(
              'fuel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
                fontSize: 25,
              ),
            ),
          ),
          CircularPercentIndicator(
            radius: 60,
            percent: speed / 300,
            lineWidth: 20,
            backgroundColor: Colors.purpleAccent.shade100,
            progressColor: Colors.purple,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            animateFromLastPercent: true,
            center: Text(
              speed.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white54,
              ),
            ),
            footer: const Text(
              'Speed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Rpm extends StatelessWidget {
  double rpm;
  Rpm({Key? key, required this.rpm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 15,
      width: SizeConfig.blockSizeHorizontal * 35,
      child: LinearPercentIndicator(
        backgroundColor: Colors.white70,
        addAutomaticKeepAlive: true,
        progressColor: Colors.lightBlueAccent,
        animateFromLastPercent: true,
        animation: true,
        animationDuration: 500,
        percent: rpm / 8000,
        barRadius: Radius.circular(15),
        leading: Text(
          'RPM',
          style: normalfont,
        ),
        trailing: Text(
          rpm.toString(),
          style: smallnormalfont,
        ),
      ),
    );
  }
}
