import 'package:apod/Models/ProviderModel.dart';
import 'package:apod/Utils/Strings.dart';
import 'package:apod/Utils/UtilsFunctions.dart';
import 'package:apod/Views/PictureScreen.dart';
import 'package:apod/Views/SideNavigationDrawer.dart';
import 'package:apod/Views/modalSheetDatePicker.dart';
import 'package:apod/Views/onWillPopScopeDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, ProviderModel  provider, Widget? child) {

      return  WillPopScope(
        onWillPop: () async {
          return await onWillPop(context);
        },
        child: SafeArea(
            child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
            drawer: SideNavigationDrawer(),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/1.jpg'),
                  fit: BoxFit.cover,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsets.all(10),
                  // shrinkWrap: true,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      StringUtils.WELCOME,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today_sharp, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            WeekDayName(provider.getSelectedDate) + ",",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            getFullDate(provider.getSelectedDate),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        // FocusScope.of(context).requestFocus(new FocusNode());
                        showModalSheetDatePicker(context,provider.getSelectedDate);

                        // showModalBottomSheet(
                        //     context: context,
                        //     enableDrag: true,
                        //     isScrollControlled: true,
                        //
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.vertical(
                        //       top: Radius.circular(22),
                        //     )),
                        //     builder: (ctx) {
                        //       DateTime cupertinoDateTime = provider.getSelectedDate;
                        //       return Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           Container(
                        //             height: 200,
                        //             child: CupertinoDatePicker(
                        //               initialDateTime: provider.getSelectedDate,
                        //               maximumDate: DateTime.now(),
                        //               minimumDate:
                        //                   DateTime.parse("2000-01-01 00:00:00"),
                        //               mode: CupertinoDatePickerMode.date,
                        //               onDateTimeChanged: (dt) {
                        //                 cupertinoDateTime = dt;
                        //               },
                        //             ),
                        //           ),
                        //           Row(
                        //             children: [
                        //               CupertinoButton(
                        //                   child: Text("Change"),
                        //                   onPressed: () {
                        //                     Navigator.pop(ctx);
                        //                     provider.setTheme = ColorOfDay(weekday: cupertinoDateTime.weekday);
                        //                     provider.setSelectedDate = cupertinoDateTime;
                        //                   }),
                        //               CupertinoButton(
                        //                   child: Text("Cancel"),
                        //                   onPressed: () => Navigator.pop(ctx)),
                        //             ],
                        //           ),
                        //         ],
                        //       );
                        //     });
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () async {
                         await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      PictureScreen()));
                        },
                        highlightColor: ColorOfDay(weekday: provider.getSelectedDate.weekday),
                        child: Text(
                          "Launch >",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      );}
    );
  }
}
