import 'package:apod/Models/ProviderModel.dart';
import 'package:apod/Utils/UtilsFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showModalSheetDatePicker(context, DateTime selectedDate) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(22),
      )),
      builder: (ctx) {
        DateTime cupertinoDateTime = selectedDate;
        return Consumer(builder:
            (BuildContext context, ProviderModel provider, Widget? child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Center(
                  child: Divider(
                    thickness: 4,
                  ),
                ),
              ),
              Text("Change Date",style: TextStyle(fontSize: 10)),
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: provider.getSelectedDate,
                  maximumDate: DateTime.now(),
                  minimumDate: DateTime.parse("2000-01-01 00:00:00"),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (dt) {
                    cupertinoDateTime = dt;
                  },
                ),
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Change",
                        style: TextStyle(
                          color: provider.getThemecolor,
                        ),),
                      onPressed: () {
                        Navigator.pop(ctx);
                        provider.setTheme =
                            ColorOfDay(weekday: cupertinoDateTime.weekday);
                        provider.setSelectedDate = cupertinoDateTime;
                      }),
                  CupertinoButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: provider.getThemecolor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(ctx)),
                ],
              ),
            ],
          );
        });
      });
}
