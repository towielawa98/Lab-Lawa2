

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';


void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      scrollBehavior: CustomScrollBehavior(),
      // TODO: Replace this with MultiProvider
      // 1
home: MultiProvider(
 providers: [
 // 2
 ChangeNotifierProvider(create: (context) => TabManager()),
 // TODO: Add GroceryManager Provider
 ChangeNotifierProvider(create: (context) => GroceryManager()),

 ],
 child: const Home(),
),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  //Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        //etc
  
  };
}
