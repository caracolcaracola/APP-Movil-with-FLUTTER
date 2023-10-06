// import 'dart:convert';

// import 'package:appmovil/models/users.dart';

// import 'package:http/http.dart' as http;

// class HttpService {
//   String url = "";

//   HttpService() {
//     url = 'http://localhost:3000';
//   }

//   Future<List<Users>> getallUsers() async {
//     final resp = await http.get(Uri.parse('$url/users'));

//     return ((jsonDecode(resp.body) as List)
//         .map((users) => Users.fromJson(users))).toList();
//   }
// }
