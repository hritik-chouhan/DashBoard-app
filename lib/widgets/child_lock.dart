import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChildLockStatus extends StatelessWidget {
  bool isChildLockActiveLeft;
  bool isChildLockActiveRight;
  ChildLockStatus(
      {Key? key,
      required this.isChildLockActiveLeft,
      required this.isChildLockActiveRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 390,
        right: 450,
        child: isChildLockActiveLeft && isChildLockActiveRight
            ? Column(
                children: const [
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
                children: const [
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
              ));
  }
}
