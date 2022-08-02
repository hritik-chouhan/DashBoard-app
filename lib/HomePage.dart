import 'package:dashboard_app/Tier_pressure.dart';
import 'package:dashboard_app/drawArrow.dart';
import 'package:dashboard_app/provider.dart';
import 'package:dashboard_app/size.dart';
import 'package:dashboard_app/widgets/child_lock.dart';
import 'package:dashboard_app/widgets/date_time_location.dart';
import 'package:dashboard_app/widgets/fuel_and_speed.dart';
import 'package:dashboard_app/widgets/weather.dart';
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final vehicle = ref.watch(vehicleSignalProvider);
    LatLng pos = LatLng(vehicle.currentLatitude, vehicle.currentLongitude);

    DateTime _now = ref.watch(DateTimeProvider);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
          CurrentLocation(pos: pos),
          date_time(now: _now),
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
          ChildLockStatus(
              isChildLockActiveLeft: vehicle.isChildLockActiveLeft,
              isChildLockActiveRight: vehicle.isChildLockActiveRight),
          Positioned(
              top: 100,
              left: 50,
              child: Container(
                width: width / 2,
                height: height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Rpm(rpm: vehicle.rpm),
                    Text(
                      vehicle.fuelRate.toString() + 'KM/Litre',
                      style: smallnormalfont,
                    ),
                    // ignore: prefer_const_constructors
                    weather(),
                    SpeedAndFuel(fuel: vehicle.fuelLevel, speed: vehicle.speed),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
