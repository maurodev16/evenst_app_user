import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FavoritePage')),
        body: SafeArea(child: Text('FavoriteController')));
  }
}
