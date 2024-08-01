// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kinema/commun/constents/localhost.dart';
import 'package:kinema/features/auth/controllers/auth.dart';
import 'package:kinema/commun/models/event.dart';
import 'package:http/http.dart' as http;

class EventsRepo {
  final String _url = 'http://$localhost/events/';

  final _authController = Get.find<AuthController>();

  Future<List<EventModel>?> getEvents() async {
    try {
      final List<EventModel> events = [];
      var url = Uri.parse('${_url}list');
      final storage = GetStorage();
      var jwt = storage.read('jwt') as String;
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $jwt',
      });

      if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String, dynamic>;
        final eventsMap = result["results"] as List<dynamic>;
        for (var i = 0; i < eventsMap.length; i++) {
          final eventMap = eventsMap[i] as Map<String, dynamic>;
          final movie = EventModel.fromMap(eventMap);
          events.add(movie);
        }
        return events;
      } else {
        await _authController.signOut();
      }
    } catch (e) {
      await _authController.signOut();
    }
    return null;
  }
}