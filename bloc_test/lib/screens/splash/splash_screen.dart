import 'dart:async';

import 'package:bloc_test/models/models.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () =>
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            image: AssetImage('assets/images/assasins.png'),
            width: 400,
            height: 400,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          color: Colors.black,
          child: Text(
            'Ecomerce',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
