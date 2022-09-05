import 'package:blochchain_dapp/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/nameFactory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NameFactory>(
      create: (context) => NameFactory(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Dapp",
        theme: ThemeData(primaryColor: Colors.teal),
        home: HomePage(),
      ),
    );
  }
}
