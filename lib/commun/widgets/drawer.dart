import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kinema_dashboard/commun/constents/colors.dart';
import 'package:kinema_dashboard/commun/constents/text_styles.dart';
import 'package:kinema_dashboard/commun/widgets/horizontal_scroller.dart';
import 'package:kinema_dashboard/commun/widgets/vertical_scroller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key, 
    this.onTap, 
    this.currentIndex,
    this.isExpanded = true,
    this.onToggleDrawer
  });

  final Function(int)? onTap;
  final int? currentIndex;
  final bool isExpanded;
  final VoidCallback? onToggleDrawer;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: double.maxFinite,
      width: isExpanded ? 250 : 90,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: CustomColors.primaryBlack,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: VerticalScroller(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, top: 20),
                child: Logo(isExpanded: isExpanded),
              ),
            ),
            const SizedBox(height: 40),
            const Spacer(),
            DrawerItems(
              onTap: (index) {
                if (onTap != null) {
                  onTap!(index);
                }
              },
              currentIndex: currentIndex,
              isExpanded: isExpanded,
            ),
            const SizedBox(height: 20),
            const Spacer(flex: 2,),
            DrowerTogglerButton(
              onToggleDrawer: onToggleDrawer, 
              isExpanded: isExpanded
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.isExpanded,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isExpanded
      ? "assets/icons/logo.svg"
      : "assets/icons/logo1.svg",
      height: 25
    );
  }
}

class DrowerTogglerButton extends StatelessWidget {
  const DrowerTogglerButton({
    super.key,
    required this.onToggleDrawer,
    required this.isExpanded,
  });

  final VoidCallback? onToggleDrawer;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggleDrawer,
      child: DrawerItem(
        properties: DrawerItemProperties(
          iconPath: isExpanded
          ? "assets/icons/hide.svg"
          : "assets/icons/show.svg", 
          label: "Hide Menu"
        ),
        isSelected: false,
        isExpanded: isExpanded,
      ),
    );
  }
}

class DrawerItems extends StatefulWidget {
  const DrawerItems({
    super.key, 
    this.onTap, 
    this.currentIndex,
    this.isExpanded = true
  });

  final Function(int)? onTap;
  final int? currentIndex;
  final bool isExpanded;

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  late List<DrawerItemProperties> items;

  @override
  void initState() {
    initDrawerItemsList();
    super.initState();
  }

  void initDrawerItemsList(){
    items = [
      DrawerItemProperties(iconPath: "assets/icons/home.svg", label: "Home"),
      DrawerItemProperties(iconPath: "assets/icons/diffusion.svg", label: "Diffusing"),
      DrawerItemProperties(iconPath: "assets/icons/reservation.svg", label: "Reservations"),
      DrawerItemProperties(iconPath: "assets/icons/analytics.svg", label: "Analytics"),
      DrawerItemProperties(iconPath: "assets/icons/feedback.svg", label: "Feedbacks"),
      DrawerItemProperties(iconPath: "assets/icons/prize.svg", label: "Fidelity Market"),
      DrawerItemProperties(iconPath: "assets/icons/event.svg", label: "Events"),
    ];
  }

  void selectItem(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        items.length,
        (index) {
          final itemProperties = items[index];
          return InkWell(
            onTap: () => selectItem(index),
            child: DrawerItem(
              properties: itemProperties,
              isExpanded: widget.isExpanded,
              isSelected: widget.currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}

class DrawerItemProperties {
  final String iconPath;
  final String label;

  DrawerItemProperties({
    required this.iconPath,
    required this.label,
  });
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.properties,
    required this.isSelected,
    this.isExpanded = true
  });

  final DrawerItemProperties properties;
  final bool isSelected;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: !isExpanded 
        ? properties.label 
        : "",
      textStyle: TextStyles.style1.copyWith(
        color: Colors.white
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: isSelected 
          ? CustomColors.black1
          : Colors.transparent,
        height: 50,
        child: HorizontalScroller(
          child: Row(
            children: [
              AnimatedContainer(
                width: 5,
                height: isSelected ? 50 : 0,
                duration: const Duration(milliseconds: 230),
                decoration: BoxDecoration(
                  color: isSelected 
                    ? CustomColors.primaryRed
                    : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(3),
                    topRight: Radius.circular(3)
                  )
                ),
              ),
              const SizedBox(width: 30),
              SvgPicture.asset(properties.iconPath,width: 23),
              const SizedBox(width: 20),
              isExpanded
              ? Text(
                properties.label,
                style: TextStyles.style1,
              )
              : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}