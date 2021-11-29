import 'package:shared_preferences/shared_preferences.dart';
DateTime setDefaultDate()
{
  return DateTime.parse("2000-01-01 00:00:00");
}
Future<DateTime>getSavedDateFromSharedPrefs()async{
  print("getting date");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String date = prefs.getString('savedDate')??setDefaultDate().toString();
  return DateTime.parse(date);
}


saveDateToSharedPrefs(DateTime dateTime)
async{
  print("Saving Date" + dateTime.toString());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('savedDate', dateTime.toString());
}