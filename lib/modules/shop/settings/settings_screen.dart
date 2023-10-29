import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Setting Screen',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
