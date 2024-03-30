import 'package:ayurvedic_centre_patients/controller/home_provider.dart';
import 'package:ayurvedic_centre_patients/controller/login_provider.dart';
import 'package:ayurvedic_centre_patients/controller/register_provider.dart';
import 'package:ayurvedic_centre_patients/view/login_screen.dart';
import 'package:ayurvedic_centre_patients/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider()),
          ChangeNotifierProvider(create: (context) => HomeProvider()),
           ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        
        ),
        debugShowCheckedModeBanner: false,
        home:LoginScreen()
      ),
    );
  }
}



