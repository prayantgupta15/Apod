import 'package:apod/Methods/openURL.dart';
import 'package:apod/Models/ProviderModel.dart';
import 'package:apod/Views/ProfileScreen.dart';
import 'package:apod/Views/datePickerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class SideNavigationDrawer extends StatelessWidget {
OpenURL openURL = OpenURL();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, ProviderModel provider, Widget? child) {
      return Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,

          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: provider.getThemecolor,

                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: new ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,

                      child: Image.asset('assets/nasa.png'),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(MdiIcons.home,color: provider.getThemecolor),

              title: Text("Home",),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => DatePickerScreen()),
                    (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.person,color: provider.getThemecolor),
              title: Text("Show Profile"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => ProfileScreen()),
                    (route) => false);
              },
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                HapticFeedback.vibrate();
                openURL.zealth();
              },
              child: Text("Zealth-ai",style: TextStyle(
                fontWeight: FontWeight.w700,
                color: provider.getThemecolor,

              ),),
            ),
            SizedBox(height: 10)
          ],
        ),
      );
    });
  }
}
