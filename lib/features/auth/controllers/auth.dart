// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kinema/features/auth/repositories/auth.dart';
import 'package:kinema/commun/models/user.dart';

class AuthController extends GetxController {
  late TextEditingController emailController,passwordController,nameController;
  late GlobalKey<FormState> emailFormKey,passwordFormKey,nameFormKey,loginFormKey;
  final _authRepo = AuthRepository();
  DateTime? dateOfBirth;

  late bool isLogedIn;

  void checkLogStatus() {
    final storage = GetStorage();
    final jwt = storage.read('jwt');
    if (jwt == null) {
      isLogedIn = false;
    } else {
      isLogedIn = true;
    }
  }

  @override
  void onInit() {
    checkLogStatus();
    emailFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();
    nameFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  String? emailValidation(){
    final isValidated =  GetUtils.isEmail(
      emailController.text
    );
    if (!isValidated) {
      return 'Invalid email address';
    }
    return null;
  }

  String? nameValidation() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      return 'Name is required.';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      return 'Invalid characters in the name. Only alphabetic characters and spaces are allowed.';
    }
    return null;
  }

  String? passwordValidation() {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$'
    );
    final isValidated = passwordRegex.hasMatch(passwordController.text.trim());
    if (!isValidated) {
      return 'Password must contain at least one lowercase letter, one uppercase letter, and one digit.';
    }
    return null;
  }


  bool validateEmail(){
    return emailFormKey.currentState!.validate();
  }

  bool validateName(){
    return nameFormKey.currentState!.validate();
  }

  bool validatePassword(){
    return passwordFormKey.currentState!.validate();
  }

  bool validateLoginForm(){
    return loginFormKey.currentState!.validate();
  }

  Future<void> registerUser(
    BuildContext context,
  ) async {

    return _authRepo.registerUser(
      context, 
      name: nameController.text,
      password: passwordController.text,
      email: emailController.text,
      dateOfBirth: "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
      phoneNumber: '+123456789',
      address: 'no'
    );
  }

  Future<void> loginUser(
    BuildContext context,
  ) async {
    isLogedIn = true;
    return _authRepo.loginUser(
      context, 
      password: passwordController.text,
      email: emailController.text,
    );
  }

  Future<UserModel?> getUserDetail(){
    return _authRepo.getUserDetails();
  }

  Future<UserModel?> updateUserDetail(UserModel user) {
    return _authRepo.updateUserDetails(user);
  }

  Future<void> signOut() async {
    await _authRepo.signOut();
    isLogedIn = false;
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}

//ABCabc123@