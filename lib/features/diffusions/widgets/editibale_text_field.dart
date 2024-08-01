import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/utils/scroll_behaviour.dart';
import '../../../commun/widgets/cutom_icon_button.dart';

class EditibaleTextField extends StatefulWidget {
  const EditibaleTextField({
    super.key, 
    required this.controller,
    this.style,
    this.maxLines = 1
  });

  final TextEditingController controller;
  final TextStyle? style;
  final int? maxLines;

  @override
  State<EditibaleTextField> createState() => _EditibaleTextFieldState();
}

class _EditibaleTextFieldState extends State<EditibaleTextField> {
  bool isEnabled = false;
  late FocusNode focusNode;
  late String initialText;

  void enableTextField(){
    isEnabled = true;
    focusNode.requestFocus();
    setState(() {});
  }

  void disableTextField(){
    widget.controller.text = initialText;
    isEnabled = false;
    setState(() {});
  }

  void saveNewText(){
    initialText = widget.controller.text;
    isEnabled = false;
    setState(() {});
  }

  @override
  void initState() {
    focusNode = FocusNode();
    initialText = widget.controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.grey1,
      ),
      borderRadius: BorderRadius.circular(5)
    );

    return ScrollConfiguration(
      behavior: const CustomScrollBehavior(),
      child: TextFormField(
        controller: widget.controller,
        focusNode: focusNode,
        maxLines: widget.maxLines,
        cursorColor: CustomColors.primaryBlack,
        style: widget.style ?? TextStyles.style5,
        readOnly: !isEnabled,
        onTapOutside: (event) {
          disableTextField();
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: outlineInputBorder,
          disabledBorder: InputBorder.none,
          errorBorder: outlineInputBorder.copyWith(
            borderSide: BorderSide(
              color: CustomColors.primaryRed
            )
          ),
          suffixIcon: !isEnabled
            ? CustomIconButton(
              onPressed: () => enableTextField(),
              backgroundColor: Colors.transparent,
              padding: 0,
              child: SvgPicture.asset("assets/icons/edit.svg",height: 20),
            )  
            : CustomIconButton(
              onPressed: () => saveNewText(),
              backgroundColor: Colors.transparent,
              padding: 20,
              child: const Icon(Icons.check_rounded),
            )
        ),
      ),
    );
  }
}