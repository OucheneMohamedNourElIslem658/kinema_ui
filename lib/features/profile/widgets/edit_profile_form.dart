import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_cupertino_date_picker.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '../../../commun/widgets/custom_icon_button.dart';
import '../controllers/profile_form.dart';

class EditProfileFrom extends StatelessWidget {
  const EditProfileFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formController = Get.put(ProfileFormController());

    return GetBuilder<ProfileFormController>(
      builder: (_) {
        return Form(
          key: formController.formKey,
          child: Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: 'Full Name',
                  controller: formController.nameController,
                  validator: (_) => formController.nameValidation(),
                  enabled: formController.enableForm == true,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Email',
                  controller: formController.emailController,
                  validator: (_) => formController.emailValidation(),
                  enabled: formController.enableForm == true,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: formController.enableForm == true
                    ? () => showDialog(
                      context: context,
                      builder: (context) => DateOfBirthDialog(formController: formController),
                    )
                    : null,
                  child: CustomTextField(
                    label: 'Date Of Birth',
                    controller: formController.dateOfBirthController,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Phone Number',
                  controller: formController.phoneController,
                  validator: (_) => formController.phoneNumberValidation(),
                  enabled: formController.enableForm ?? false,
                ),
                const SizedBox(height: 20),
                const Spacer(),
                if (formController.enableForm == null) 
                  const SizedBox() 
                else formController.enableForm == false 
                  ? CustomIconButton(
                    onPressed: () => formController.editForm(), 
                    backgroundColor: CustomColors.black3,
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset('assets/icons/edit2.svg')
                  )
                  : CustomElevatedButton(
                    onPressed: () async => await formController.validateForm(),
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 16), 
                    child: Text(
                      'Save Changes',
                      style: TextStyles.style5.copyWith(
                        color: CustomColors.primaryBej
                      ),
                    )
                  ),
                const Spacer(),
                const SizedBox(height: 70)
              ],
            ),
          )
        );
      }
    );
  }
}

class DateOfBirthDialog extends StatefulWidget {
  const DateOfBirthDialog({
    super.key,
    required this.formController,
  });

  final ProfileFormController formController;

  @override
  State<DateOfBirthDialog> createState() => _DateOfBirthDialogState();
}

class _DateOfBirthDialogState extends State<DateOfBirthDialog> {
  late DateTime currentDate;
  @override
  void initState() {
    currentDate = widget.formController.formatDateOfBirth(widget.formController.dateOfBirthController.text);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomColors.black3
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Enter your date of birth :',
                style: TextStyles.style5,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: Stack(
                children: [
                  Positioned(
                    top: -1000,
                    left: 0,
                    right: 0,
                    bottom: -1000,
                    child: CustomCupertinoDatePicker(
                      initialDate: currentDate,
                      onDateChanged: (p0) {
                        currentDate = p0;
                      },
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  widget.formController.changeDateOfBirth(currentDate);
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 16), 
                child: Text(
                  'Save',
                  style: TextStyles.style5,
                )
              ),
            )
          ],
        )
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.enabled = false,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final bool enabled;
  final String? Function(String?)? validator;
  

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: CustomColors.greyText3,
      ),
      borderRadius: BorderRadius.circular(12)
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.style35,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          cursorColor: CustomColors.greyText1,
          style : TextStyles.style35,
          enabled: enabled,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(
                color: CustomColors.primaryBej
              )
            ),
            errorBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(
                color: CustomColors.primaryRed
              )
            ),
            focusedErrorBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(
                color: CustomColors.primaryRed
              )
            ),
            disabledBorder: outlineInputBorder,
          ),
        )
      ],
    );
  }
}