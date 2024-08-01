import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kinema/commun/constents/localhost.dart';
import 'package:kinema/commun/models/fidelity_item.dart';
import 'package:http/http.dart' as http;
import 'package:kinema/features/auth/controllers/auth.dart';

class FiedelityRepo {
  final _url = "http://$localhost/merch/";
  final _authController = Get.find<AuthController>();


  Future<List<FidelityItem>?> getItems() async {
    try {
      final List<FidelityItem> items = [];
      var url = Uri.parse('${_url}list');
      final storage = GetStorage();
      var jwt = storage.read('jwt') as String;
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $jwt',
      });

      if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String, dynamic>;
        final itemsMap = result["results"] as List<dynamic>;
        for (var i = 0; i < itemsMap.length; i++) {
          final itemMap = itemsMap[i] as Map<String, dynamic>;
          final movie = FidelityItem.fromJson(itemMap);
          items.add(movie);
        }
        return items;
      } else {
        await _authController.signOut();
      }
    } catch (e) {
      await _authController.signOut();
    }
    return null;
  }
}