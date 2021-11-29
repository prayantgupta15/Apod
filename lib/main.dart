import 'package:apod/Views/datePickerScreen.dart';
import 'package:apod/Models/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderModel(),

      child: Consumer(
        builder: (BuildContext context, ProviderModel  provider, Widget? child) {
          return  MaterialApp(
            title: 'Apod',
            theme: ThemeData(
              accentColor: provider.getThemecolor,
            ),
            home: DatePickerScreen(),
          );
        },
      ),
    );
  }
}
