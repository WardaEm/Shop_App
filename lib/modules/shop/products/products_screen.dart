import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
   'Product Screen',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
