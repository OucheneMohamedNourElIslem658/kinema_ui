import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_icon_button.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.validator
  });

  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var show = true;
  void swithShow(){
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 3,
        color: CustomColors.primaryBej
      )
    );
    return SizedBox(
      // height: 60,
      child: TextFormField(
        controller: widget.controller,
        style: TextStyles.style5,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: CustomColors.primaryBej,
        cursorWidth: 3,
        obscureText: !show,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorMaxLines: 10,
          errorStyle: TextStyles.style7.copyWith(
            color: CustomColors.primaryRed
          ),
          errorBorder: outlineInputBorder.copyWith(
            borderSide: const BorderSide(
              color: CustomColors.primaryRed,
              width: 3
            )
          ),
          focusedErrorBorder: outlineInputBorder.copyWith(
            borderSide: const BorderSide(
              color: CustomColors.primaryRed,
              width: 3
            )
          ),
          suffixIcon: widget.isPassword
          ? CustomIconButton(
            onPressed: () => swithShow(),
            child: show
            ? SvgPicture.asset('assets/icons/hide.svg')
            : SvgPicture.asset('assets/icons/see.svg'),
          ):null
        ),
      ),
    );
  }
}

//m_ouchene@estin.dz
//ABCabc123@