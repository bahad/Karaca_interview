import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytiptop/src/utils/constants.dart';
import 'package:trytiptop/src/viewmodel/shop_viewmodel.dart';

import 'src/view/navhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopProvider>(
          create: (_) => ShopProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.primaryColor,
              )),
          home: const NavHome()),
    );
  }
}
