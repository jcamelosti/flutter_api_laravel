import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi{
  final String _url = 'https://ferramentasdemkt.com.br/api/';
  final String _imgUrl='https://ferramentasdemkt.com.br/uploads/';

  getImage(){
    return _imgUrl;
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: await _headers()
    );
  }
  getData(apiUrl) async {
    var fullUrl = _url + apiUrl ;
    return await http.get(
        Uri.parse(fullUrl),
        headers: await _headers()
    );
  }

  /*_setHeaders() async => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization': 'Bearer ${await _getTokenBearer()}'
  };*/

  Future<Map<String, String>> _headers() async {
    final token = await _getTokenBearer();

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    return headers;
  }

  /*_getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }*/

  _getTokenBearer() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token;
  }

  getArticles(apiUrl) async {

  }

  getPublicData(apiUrl) async {
    var fullUrl = _url + apiUrl ;
    final headers = await _headers();
    print(fullUrl);
    return await http.get(
        Uri.parse(fullUrl),
        headers: headers,
    );
  }
}