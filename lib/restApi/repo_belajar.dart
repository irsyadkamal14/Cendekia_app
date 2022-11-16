import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_premmob/models/model_belajar.dart';

class Repo_belajar {
  final _baseurl = "https://634c440dacb391d34a824311.mockapi.io/tb_belajar";
  //final _baseurl = "http://192.168.1.7/cendekia_app/belajar.php";
  Future getData_Belajar() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Tb_belajar> tb_item =
            it.map((e) => Tb_belajar.fromJson(e)).toList();
        return tb_item;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
