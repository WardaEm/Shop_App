import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Favourite Screen',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}