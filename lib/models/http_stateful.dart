import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, name, job, createdAt;

  HttpStateful({this.id, this.name, this.job, this.createdAt});

  static Future<HttpStateful> connectApi(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(url, body: {
      "name": name,
      "job": job,
    });

    // return json.decode(hasilResponse.body); //or data = json.decode
    //atau HttpStateful(id: data["id"], name: data["name"];)
    var data = json.decode(hasilResponse.body);
    return HttpStateful(
        id: data["id"],
        name: data["name"],
        job: data["job"],
        createdAt: data["createdAt"]);
  }
}
