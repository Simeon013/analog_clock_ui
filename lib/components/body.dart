import 'dart:async';
import 'dart:math';

import 'package:analog_clock_ui/components/time_in_hour_and_minute.dart';
import 'package:analog_clock_ui/constants.dart';
import 'package:analog_clock_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'clock.dart';
import 'clock_painter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children:[
            Text(
              'Cotonou, Benin',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const TimeInHourAndMinute(),
            const Spacer(),
            const Clock(),
            const Spacer(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CountryCard(
                    country: 'West Africa',
                    timeZone: 'Cotonou, Benin',
                    iconSrc: 'assets/icons/world.svg',
                    time: '12:00',
                    period: 'AM',
                  ),
                  CountryCard(
                    country: 'West Africa',
                    timeZone: 'Cotonou, Benin',
                    iconSrc: 'assets/icons/world.svg',
                    time: '12:00',
                    period: 'AM',
                  ),
                  CountryCard(
                    country: 'West Africa',
                    timeZone: 'Cotonou, Benin',
                    iconSrc: 'assets/icons/world.svg',
                    time: '12:00',
                    period: 'AM',
                  )
                ],
              ),
            ),
            const Spacer(),
          ]
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.country,
    required this.timeZone,
    required this.iconSrc,
    required this.time,
    required this.period,
  });

  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(200),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryIconTheme.color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  timeZone,
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      iconSrc,
                      width: getProportionateScreenHeight(40),
                      color: Theme.of(context).hintColor,
                    ),
                    const Spacer(),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: getProportionateScreenHeight(35),
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        period,
                      ),
                    ),
                  ],
                )
              ]
            ),
          )
        ),
      ),
    );
  }
}


