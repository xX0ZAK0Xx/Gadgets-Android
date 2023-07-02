import 'package:flutter/material.dart';
import 'package:gadgets/pages/cart_page.dart';
import 'package:gadgets/pages/login_page.dart';
import 'package:gadgets/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:google_fonts/google_fonts.dart';'
import 'core/store.dart';
import 'pages/home_page.dart';
import 'widgets/themes.dart';
void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,// should be "/"
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartPage: (context) => CartPage(),
      },
    );
  }
}