import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kinema/features/auth/controllers/auth.dart';
import 'package:kinema/commun/models/user.dart';

import '../../../commun/utils/date_formats.dart';

class ProfileFormController extends GetxController {
  late TextEditingController nameController,emailController,phoneController,dateOfBirthController;
  late GlobalKey<FormState> formKey;
  UserModel? currentUser;
  bool? enableForm;
  final authController = Get.find<AuthController>();

  Future<void> initialiseCurrentUser() async {
    currentUser = (await authController.getUserDetail())!;
    initForm();
    update();
  }

  Future<void> updateCurrentUser() async {
    currentUser = UserModel(
      id: currentUser!.id,
      fullName: nameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      dateOfBirth: dateOfBirthController.text,
      username: currentUser!.username
    );
    currentUser = (await authController.updateUserDetail(currentUser!))!;
    initForm();
    update();
  }

  void initForm(){
    nameController.text = currentUser!.fullName!;
    emailController.text = currentUser!.email!;
    dateOfBirthController.text = currentUser!.dateOfBirth!;
    phoneController.text = currentUser!.phoneNumber!;
    enableForm = false;
    update();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      formKey = GlobalKey<FormState>();  
      nameController = TextEditingController();
      emailController = TextEditingController();
      dateOfBirthController = TextEditingController();
      phoneController = TextEditingController();
      await initialiseCurrentUser();
    });
    
    super.onInit();
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

  String? phoneNumberValidation() {
    final phoneNumber = phoneController.text.trim();
    final isPhoneValidated = RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(phoneNumber);
    if (isPhoneValidated || phoneNumber == '') {
      return null;
    }
    return 'Invalid phone number';
  }

  String? emailValidation() {
    final isValidated = GetUtils.isEmail(emailController.text);
    final isEmailValidated = isValidated;
    update();
    if (isEmailValidated || emailController.text.trim() == '') {
      return null;
    }
    return 'Invalid email';
  }

  DateTime formatDateOfBirth(String dateString){
    DateTime parsedDate = DateTime.parse(dateString);
    return parsedDate;
  }

  void changeDateOfBirth(DateTime date){
    dateOfBirthController.text = formateDateToString(date);
    update();
  }

  void editForm() async {
    enableForm = true;
    update();
  }

  Future<bool> validateForm() async {
    final isValid = formKey.currentState!.validate();
    if(isValid){
      formKey.currentState!.save();
      await updateCurrentUser();
      enableForm = false;
      update();
      return true;
    }
    return false;
  }

  void cancelEdit(BuildContext context) async {
    initForm();
    enableForm = false;
    update();
  }
}