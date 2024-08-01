// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http ;
import 'package:kinema/commun/constents/localhost.dart';
import 'package:kinema/commun/controllers/program.dart';
import 'package:kinema/commun/utils/custom_snack_bar.dart';
import 'package:kinema/features/event/controllers/event.dart';
import 'package:kinema/features/fidelity/controllers/fidelity.dart';
import 'package:kinema/features/profile/controllers/profile_form.dart';
import 'package:kinema/features/reservations/controllers/reservations.dart';

import '../../../commun/models/user.dart';

class AuthRepository {
  final _url = 'http://$localhost/cinephile/';

  Future<void> registerUser(
    BuildContext context,
    {
      required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String address,
      required String dateOfBirth
    }
  ) async {
    try {
      final user1 = {
        "Full_Name": name,
        "username": name.replaceAll(' ', ''),
        "email": email,
        "Phone_Number": phoneNumber,
        "Address": address,
        "Date_of_Birth": dateOfBirth,
        "password": password,
      };
      print(user1);
      final response =
          await http.post(Uri.parse('${_url}register'), body: user1);
      if (response.statusCode == 200) {
        showSnackBar('Successfully signed up', context);
        loginUser(context, email: email, password: password);
      } else {
        showSnackBar(response.body, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
  

  Future<void> loginUser(
    BuildContext context,
    {
      required String email,
      required String password,
    }
  ) async {
    print("started");
    try {
      var url = Uri.parse('${_url}login');
      var response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var jwt = responseData['jwt'];
        var refreshToken = responseData['refresh_token'];
        final storage = GetStorage();
        await storage.write('jwt', jwt);
        await storage.write('refresh_token', refreshToken);
        await storage.write('email', email);
        GoRouter.of(context).go('/Movies');
        showSnackBar("successfully loged in", context);
      } else {
        showSnackBar(response.body, context);
        print(response.body);
      }
    print("ended");
    } catch (e) {
      print(e.toString());
      showSnackBar(e.toString(), context);
    }
    
  }

  Future<UserModel?> getUserDetails() async {
    try {
      var url = Uri.parse('${_url}user');
      final storage = GetStorage();
      var jwt = storage.read('jwt') as String;
      var email = storage.read('email') as String;
      var response = await http.post(url, headers: {
        'Authorization': 'Bearer $jwt',
      }, body: {
        "email": email
      });
      if (response.statusCode == 200) {
        var userData = json.decode(response.body);
        return UserModel.fromJson(userData);
      } else {
        await signOut();
      }
    } catch (e) {
      await signOut();
    }
    return null;
  }


  Future<UserModel> updateUserDetails(UserModel userModel) async {
    try {
      
      var url = Uri.parse('${_url}update/${userModel.id}');
      final storage = GetStorage();
      var jwt = storage.read('jwt') as String;
      var response = await http.patch(url, headers: {
        'Authorization': 'Bearer $jwt',
      }, body: {
        "Full_Name": userModel.fullName,
        "email": userModel.email,
        "Phone_Number": userModel.phoneNumber,
        "Date_of_Birth": userModel.dateOfBirth,
        "username": userModel.username
      }
      );
      if (response.statusCode == 200) {
        var userData = json.decode(response.body);
        print(userData);
        return UserModel.fromJson(userData);
      } else {
        await signOut();
      }
    } catch (e) {
      print(e.toString());
      await signOut();
    }
    return userModel;
  }

  Future<void> signOut() async {
    final storage = GetStorage();
    await storage.remove('jwt');
    await storage.remove('refresh_token');
    await storage.remove('email');
    await storage.remove('avatar');
    Get.delete<ProfileFormController>();
    Get.delete<EventController>();
    Get.delete<ProgramController>();
    Get.delete<FidelityController>();
    Get.delete<ReservationsController>();
  }
}