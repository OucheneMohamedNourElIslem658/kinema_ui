import 'package:flutter/material.dart';

import '../../../commun/widgets/custom_network_image.dart';
import '/commun/widgets/vertical_scroll_behaviour.dart';
import '../../../commun/constents/colors.dart';
import '../../reservations/widgets/custom_appbar.dart';
import 'buy_ticket_button.dart';

class ScreenWithShadow extends StatelessWidget {
  const ScreenWithShadow({
    super.key, 
    required this.child, 
    required this.backgroundImageURL, 
    this.showAppBar = false,
    this.showPayButton = true,
    this.onPayButtonPressed, 
    this.shadowPadding,
    this.onGoBack,
    this.scrollController,
    this.appBar
  });

  final Widget child;
  final String backgroundImageURL;
  final bool showPayButton,showAppBar;
  final double? shadowPadding;
  final VoidCallback? onPayButtonPressed,onGoBack;
  final ScrollController? scrollController;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: CustomNetworkImage(
            backgroundImageURL: backgroundImageURL
          )
        ),
        VerticalScrollBehaviour(
          controller: scrollController,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0,shadowPadding ?? -0.5),
                      end: Alignment.topCenter,
                      colors: const [
                        CustomColors.black,
                        CustomColors.transparent
                      ]
                    )
                  ),
                ),
              ),
              child
            ],
          ),
        ),
        showPayButton
        ? ByTicketButton(
            onPressed: onPayButtonPressed ?? () {},
          )
        :const SizedBox(),
        showAppBar
        ?Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: SafeArea(
            child: appBar ?? customAppBar(onGoBack: onGoBack)
          ),
        )
        : const SizedBox(),
      ],
    );
  }
}