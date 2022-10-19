import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> fetchDataFromAPI(String url) async {
  //! previously we can use URL as string directly to http requests bu now need to convert it from string to Uri
  final res = await http.get(Uri.parse(url));
  //* 200 is equivalent to ok (the connection is established correctly)
  if (res.statusCode == 200) {
    //! we use json.decode to parse the data from String to json
    return json.decode(res.body);
  } else {
    throw Exception("the request seems to be rejected somehow ");
  }
}
