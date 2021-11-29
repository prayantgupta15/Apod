import 'package:apod/Methods/openURL.dart';
import 'package:apod/Models/ProviderModel.dart';
import 'package:apod/Utils/Strings.dart';
import 'package:apod/Utils/UtilsFunctions.dart';
import 'package:apod/Views/SideNavigationDrawer.dart';
import 'package:apod/Views/onWillPopScopeDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  OpenURL openURL = new OpenURL();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, ProviderModel provider, Widget? child) {
        return WillPopScope(
          onWillPop: () async {
            return await onWillPop(context);
          },
          child: SafeArea(
              child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      provider.setSelectedDate = DateTime.now();
                    },
                    child: Text(
                      WeekDayName(DateTime.now()) +
                          ", " +
                          getFullDate(DateTime.now()),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          backgroundColor: Colors.white10),
                    ),
                  ),
                )
              ],
            ),
            drawer: SideNavigationDrawer(),
            body: Column(
              // shrinkWrap: true,
              children: [
                UserAccountsDrawerHeader(
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/nasa.png'),
                      backgroundColor: provider.getThemecolor,
                    ),
                  ],
                  accountName: Text(
                    "Prayant Gupta",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22),
                  ),
                  accountEmail: Text(
                    "(Developer)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/me.jpg'),
                    backgroundColor: provider.getThemecolor,
                  ),
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  iconColor: provider.getThemecolor,
                  collapsedIconColor: provider.getThemecolor,
                  title: Text("Connect via",
                      style: TextStyle(
                          color: provider.getThemecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(MdiIcons.gmail, color: Colors.red),
                          title: Text(StringUtils.EMAIL),
                          onTap: () {
                            HapticFeedback.vibrate();
                            openURL.mail();
                          },
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.phone, color: Colors.green),
                          title: Text(StringUtils.PHONENO),
                          onTap: () {
                            HapticFeedback.vibrate();
                            openURL.call();
                          },
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.linkedin, color: Colors.blue),
                          title: Text(StringUtils.NAME),
                          onTap: () {
                            HapticFeedback.vibrate();
                            openURL.linkedin();
                          },
                        ),
                        ListTile(
                          leading: Icon(MdiIcons.github, color: Colors.black),
                          title: Text(StringUtils.NAME),
                          onTap: () {
                            HapticFeedback.vibrate();
                            openURL.github();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
