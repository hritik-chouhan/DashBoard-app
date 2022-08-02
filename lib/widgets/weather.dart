import 'package:dashboard_app/font.dart';
import 'package:dashboard_app/size.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class weather extends StatelessWidget {
  const weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black38,
      ),
      height: SizeConfig.safeBlockVertical * 30,
      width: SizeConfig.blockSizeHorizontal * 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Wheather',
                  style: smallnormalfont,
                  textAlign: TextAlign.left,
                ),
              )),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                        width: SizeConfig.blockSizeHorizontal * 5,
                        child: Image.asset(
                          'images/thermostate.png',
                          color: Colors.orangeAccent,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text('23 \u00B0', style: smallnormalfont),
                    Text(
                      'Inside Car',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' 25 \u00B0',
                      style: smallnormalfont,
                    ),
                    Text(
                      'Outside car',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                        width: SizeConfig.blockSizeHorizontal * 5,
                        child: Image.asset(
                          'images/cloud.png',
                          color: Colors.orangeAccent,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'SUNNY',
                      style: smallnormalfont,
                    ),
                    Text(
                      'wheather',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '6 KM/H',
                      style: smallnormalfont,
                    ),
                    Text(
                      'Wind speed',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
