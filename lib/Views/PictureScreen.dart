import 'package:apod/Methods/sharedPrefs.dart';
import 'package:apod/Models/NasaAPODModel.dart';
import 'package:apod/Methods/fetchImage.dart';
import 'package:apod/Models/ProviderModel.dart';
import 'package:apod/Utils/UtilsFunctions.dart';
import 'package:apod/Views/modalSheetDatePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PictureScreen extends StatefulWidget {
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  double infoSheetheight = 40;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, ProviderModel provider, Widget? child) {
      return WillPopScope(
        onWillPop: () async {
          provider.setSelectedDate = setDefaultDate();
          return false;
        },
        child: SafeArea(
            child: Scaffold(
          body: Container(
            child: FutureBuilder(
              future: fetchImages(provider.getSelectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Stack(
                    children: [
                      Center(child: CircularProgressIndicator(
                        color: provider.getThemecolor,
                      )),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context, provider.getSelectedDate);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                      ),
                    ],
                  );
                else {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    dynamic d = snapshot.data;
                    NasaAPODModel nasaAPODModel = d;
                    return Stack(
                      children: [
                        GestureDetector(
                          onLongPress: () async {
                            HapticFeedback.vibrate();
                            showModalSheetDatePicker(context,provider.getSelectedDate);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      nasaAPODModel.url,
                                    ))),
                          ),
                        ),
                        StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) ss) {
                            return Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    ss(() {
                                      if (infoSheetheight <= 40)
                                        infoSheetheight =
                                            MediaQuery.of(context).size.height *
                                                0.4;
                                      else
                                        infoSheetheight = 40;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    height: infoSheetheight,
                                    // margin: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(22)),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Scrollbar(
                                      child: ListView(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        shrinkWrap: true,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 130),
                                            child: Center(
                                              child: Divider(
                                                thickness: 4,
                                              ),
                                            ),
                                          ),
                                          Center(child: Text(
                                              infoSheetheight<=40?
                                              "Tap to open":"Tap to close",style: TextStyle(fontSize: 10))),

                                          SizedBox(height: 5),
                                          Center(child: Text("Description"
                                          , style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: provider.getThemecolor,
                                            ),
                                          )),
                                          SizedBox(height: 10),

                                          Text(
                                            WeekDayName(provider
                                                .getSelectedDate) +
                                            ", " +
                                            getFullDate(provider
                                                .getSelectedDate),
                                            style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            nasaAPODModel.explanation,
                                            textAlign: TextAlign.justify,

                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context, provider.getSelectedDate);
                            },
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: Text("Error occured while fetching",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),));
                  }
                }
              },
            ),
          ),
        )),
      );
    });
  }
}
