import 'package:apod/Models/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<bool> onWillPop(context) async {
  return (await showDialog(
    context: context,
    builder: (context) => Consumer(
        builder: (BuildContext context, ProviderModel provider, Widget? child) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No',
            style: TextStyle(color: provider.getThemecolor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes',
                style: TextStyle(color: provider.getThemecolor)),
          ),
        ],
      );
    }),
  ));
}
