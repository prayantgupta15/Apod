import 'package:apod/Models/NasaAPODModel.dart';
import 'package:http/http.dart' as http;


Future<dynamic> fetchImages(DateTime dateTime)
async{
  NasaAPODModel nasaAPODModel= new NasaAPODModel(date: dateTime);
  String date  = dateTime.toString().split(' ')[0];
  String KEY = "TJ5rsxWP9PyyWrGEgwjugah1JxYhZHXMJbMwbI1B";
  String url = 'https://api.nasa.gov/planetary/apod?api_key=${KEY}&date=${date}';
  http.Response res = await http.get(Uri.parse(url));
  switch(res.statusCode)
  {
    case 200: nasaAPODModel = NasaAPODModelFromMap(res.body);
    return nasaAPODModel;
    default:
      return null;
  }


}