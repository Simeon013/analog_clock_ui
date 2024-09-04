import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/my_theme_provider.dart';
import '../size_config.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: kShadowColor.withOpacity(0.14),
                        blurRadius: 64,
                      )
                    ]
                ),
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: CustomPaint(
                    painter: ClockPainter(context, _dateTime),
                  ),
                ),
              )
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          left: 0,
          child: Consumer<MyThemeProvider>(
            builder: (context, theme, child) => IconButton(
              onPressed: () {
                theme.themeMode = theme.themeMode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
              },
              icon: Icon(
                theme.themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            )
          )
        )
      ],
    );
  }
}

