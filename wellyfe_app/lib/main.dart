import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wellyfe_app/Core/Model/SignInModel.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';
import 'package:wellyfe_app/Screen/SignInScreen/SignInScreen.dart';

import 'Core/Providers/DiaryProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInModel()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => DiaryProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wellyfe',
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 400,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      home: SignInScreen(),
      initialRoute: '/',
    );
  }
}