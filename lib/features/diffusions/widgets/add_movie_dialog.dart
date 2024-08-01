import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema_dashboard/features/diffusions/controllers/diffusions.dart';

import '/features/diffusions/widgets/trailers_drop_dow.dart';
import '../../../commun/widgets/dialog_actions.dart';
import '/commun/widgets/custom_dropdown_menu.dart';
import '../../../commun/widgets/dialog_card.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class AddMovieDialogBox extends StatelessWidget {
  const AddMovieDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final diffusionsController = Get.put(DiffusionsController());
    final trailers = diffusionsController.trailers;
    
    return DialogCard(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New Movie",
              style: TextStyles.style6,
            ),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MoviePoster(),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTitleTextField(),
                        const SizedBox(height: 12),
                        const TypeDropdownMenu(),
                        const SizedBox(height: 12),
                        TrailersDropdownMenu(trailers: trailers),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            DialogActions(
              onConfirm: (){}, 
              buttonsAlignment: MainAxisAlignment.end,
              confirmMessage: "Save"
            )
          ],
        ),
      ),
    );
  }
}

class TypeDropdownMenu extends StatelessWidget {
  const TypeDropdownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movie Type",
          style: TextStyles.style8,
        ),
        const SizedBox(height: 5),
        CustomDropdownMenu(
          initialSelection: 3,
          items: const ["English","French","Arabic","Original"],
          enableSearch: false,
          borderColor: CustomColors.grey1,
          borderThikness: 2,
        ),
      ],
    );
  }
}

class CustomTitleTextField extends StatelessWidget {
  const CustomTitleTextField({
    super.key,
    this.controller
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movie Title",
          style: TextStyles.style8,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.grey2.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5)
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: CustomColors.primaryBlack,
            style: TextStyles.style1.copyWith(
              color: CustomColors.primaryBlack
            ),
            maxLines: 1,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10
              )
            ),
          ),
        ),
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DottedBorder(
          strokeWidth: 3,
          dashPattern: const [6,4],
          color: CustomColors.grey4,
          child: SizedBox(
            height: 270,
            width: 180,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/picture.svg",
                    width: 65,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Movie Poster",
                    style: TextStyles.style1.copyWith(
                      color: CustomColors.grey4
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: (){}, 
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/upload.svg",height: 18),
              const SizedBox(width: 5),
              Text(
                "Upload New Picture",
                style: TextStyles.style5.copyWith(
                  color: CustomColors.blue1,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}