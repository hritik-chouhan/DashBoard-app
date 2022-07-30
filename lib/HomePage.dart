import 'package:dashboard_app/Tier_pressure.dart';
import 'package:dashboard_app/drawArrow.dart';
import 'package:dashboard_app/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlng/latlng.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Kuksa-server/vehicle_config.dart';
import 'Kuksa-server/vehicle_provider.dart';
import 'font.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Map calendar = {
    1: 'jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'jun',
    7: 'July',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };
  @override
  Widget build(BuildContext context) {
    // double fuel = ref.watch(fuelProvider);
    // print(fuel);
    final vehicle = ref.watch(vehicleSignalProvider);
    LatLng pos = LatLng(vehicle.currentLatitude, vehicle.currentLongitude);
    print(pos.latitude);
    print(pos.longitude);
    // print('frontltp');
    // print(vehicle.frontLeftTP);
    // print('rearltp');
    // print(vehicle.rearLeftTP);
    // DateTime _now = ref.watch(DateTimeProvider);
    DateTime _now = DateTime.now();
    double height = MediaQuery.of(context).size.height;
    print(height);
    double width = MediaQuery.of(context).size.width;
    print(width);
    // Map response = await getAdress(Position);
    // String curradress = response['features'][0]['place_name'];

    bool childlock = true;

    int hour = _now.hour > 12 ? _now.hour - 12 : _now.hour;
    String _hour =
        hour.toString().length == 1 ? '0' + hour.toString() : hour.toString();
    int minute = _now.minute;
    String _minute = minute.toString().length == 1
        ? '0' + minute.toString()
        : minute.toString();

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Colors.black87,
            ),
          ),
          Positioned(
            top: 50,
            right: 50,
            child: FutureBuilder(
              future: getAdress(pos),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as dynamic;
                    return Center(
                      child: Text(
                        data['features'].length == 0
                            ? 'No location defined'
                            : data['features'][0]['place_name'],
                        style: smallnormalfont,
                      ),
                    );
                  }
                }
                return Text(
                  'Loading to fetch location',
                  style: smallnormalfont,
                );
              },
            ),
          ),
          Positioned(
              top: 140,
              left: 60,
              child: Text(
                vehicle.fuelRate.toString() + 'KM/Litre',
                style: smallnormalfont,
              )),
          Positioned(
              top: height / 36,
              left: width / 40,
              right: width / 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(calendar[_now.month] + "  " + _now.day.toString(),
                      style: normalfont),
                  Text(
                    _now.hour > 12
                        ? _hour + ':' + _minute + ' PM'
                        : _hour + ':' + _minute + ' AM',
                    style: normalfont,
                  ),
                ],
              )),
          Positioned(
              top: 190,
              right: 50,
              child: Container(
                height: 100,
                width: 130,
                child: CustomPaint(
                  painter: Arrowpaint(),
                ),
              )),
          Positioned(
              top: 190,
              right: 350,
              child: Container(
                height: 100,
                width: 130,
                child: CustomPaint(
                  painter: Arrowpaint2(),
                ),
              )),
          Positioned(
              top: 500,
              right: 350,
              child: RotatedBox(
                quarterTurns: 2,
                child: Container(
                  height: 100,
                  width: 130,
                  child: CustomPaint(
                    painter: Arrowpaint(),
                  ),
                ),
              )),
          Positioned(
              top: 500,
              right: 50,
              child: RotatedBox(
                quarterTurns: 2,
                child: Container(
                  height: 100,
                  width: 130,
                  child: CustomPaint(
                    painter: Arrowpaint2(),
                  ),
                ),
              )),
          Positioned(
            top: 130,
            right: 350,
            child: TierPressure(
                tname: 'L Front Tier', tpress: vehicle.frontLeftTP),
          ),
          Positioned(
            top: 600,
            right: 350,
            child:
                TierPressure(tname: 'L Rear Tier', tpress: vehicle.rearLeftTP),
          ),
          Positioned(
            top: 130,
            right: 0,
            child: TierPressure(
                tname: 'R Front Tier', tpress: vehicle.frontRightTP),
          ),
          Positioned(
            top: 600,
            right: 0,
            child:
                TierPressure(tname: 'R Rear Tier', tpress: vehicle.rearRightTP),
          ),
          Positioned(
              top: 390,
              right: 350,
              child: RotatedBox(
                quarterTurns: 2,
                child: Container(
                  height: 50,
                  width: 100,
                  child: CustomPaint(
                    painter: simplearrow(),
                  ),
                ),
              )),
          Positioned(
              bottom: height / 15,
              right: width / 17,
              child: SizedBox(
                height: height * 0.7,
                width: width * 0.4,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 10),
                  child: Image.asset('images/car_img.png'),
                ),
              )),
          Positioned(
              bottom: 250,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black38,
                ),
                height: 250,
                width: 300,
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
                                  height: 50,
                                  width: 50,
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
                                  height: 50,
                                  width: 50,
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
              )),
          Positioned(
              top: 390,
              right: 450,
              child: vehicle.isChildLockActiveLeft &&
                      vehicle.isChildLockActiveRight
                  ? Column(
                      children: [
                        Text(
                          "Child Lock",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          "Activated",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.lock,
                          size: 15,
                          color: Colors.green,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'No child  Lock',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.lock_open_outlined,
                          size: 15,
                          color: Colors.red,
                        ),
                      ],
                    )),
          Positioned(
              bottom: 20,
              left: 20,
              child: SizedBox(
                width: width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularPercentIndicator(
                      radius: 60,
                      percent: vehicle.fuelLevel / 100,
                      lineWidth: 20,
                      // linearGradient: LinearGradient(colors: [Colors.redAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.lightGreenAccent],
                      // stops: [0.1,0.3,0.6,1],
                      //   begin: Alignment(1,0),
                      //   end: Alignment(0,1),
                      // ),
                      backgroundColor: Colors.lightBlue.shade100,
                      progressColor: vehicle.fuelLevel < 25
                          ? Colors.redAccent
                          : vehicle.fuelLevel < 50
                              ? Colors.orange
                              : Colors.green,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      animateFromLastPercent: true,
                      center: Text(
                        vehicle.fuelLevel.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white54,
                        ),
                      ),
                      footer: Text(
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
                      percent: vehicle.speed / 300,
                      lineWidth: 20,
                      backgroundColor: Colors.purpleAccent.shade100,
                      progressColor: Colors.purple,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      animateFromLastPercent: true,
                      center: Text(
                        vehicle.speed.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white54,
                        ),
                      ),
                      footer: Text(
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
              )),
          Positioned(
              left: 30,
              top: 80,
              child: SizedBox(
                height: 50,
                width: 300,
                child: LinearPercentIndicator(
                  backgroundColor: Colors.white70,
                  addAutomaticKeepAlive: true,
                  progressColor: Colors.lightBlueAccent,
                  animateFromLastPercent: true,
                  animation: true,
                  animationDuration: 500,
                  percent: vehicle.rpm / 8000,
                  barRadius: Radius.circular(15),
                  leading: Text(
                    'RPM',
                    style: normalfont,
                  ),
                  trailing: Text(
                    vehicle.rpm.toString(),
                    style: smallnormalfont,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
