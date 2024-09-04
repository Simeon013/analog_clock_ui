import 'package:analog_clock_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).iconTheme.color,
        )
      ),
      actions: [
        buildAddButton(context)
      ]
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: getProportionateScreenWidth(32),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              )
            ),
          ),
        );
  }
}
