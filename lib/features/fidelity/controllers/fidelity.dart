import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/models/fidelity_item.dart';
import 'package:kinema/commun/utils/custom_snack_bar.dart';
import 'package:kinema/features/fidelity/repositories/fiedelity.dart';
import 'package:kinema/features/profile/controllers/profile_form.dart';

import '../../../commun/utils/navigation_methods.dart';
import '../screens/invoice.dart';

class FidelityController extends GetxController {
  final List<FidelityItem> cardItems = [];

  void deleteItem(int index) {
    cardItems.removeAt(index);
    update();
  }

  void addItem(
    FidelityItem fidelityItem
  ) {
    cardItems.add(fidelityItem);
    update();
  }

  late ScrollController scrollController;
  bool isScrollingUp = true;

  void listenToScrollStatus() {
    if (scrollController.position.userScrollDirection !=
        ScrollDirection.forward) {
      isScrollingUp = false;
    } else {
      isScrollingUp = true;
    }
    update();
  }
    final _itemsRepo = FiedelityRepo();
  List<FidelityItem> items = [];

  Future<void> getItems() async {
    items = (await _itemsRepo.getItems()) ?? [];
    update();
  }

  void clearCard(){
    cardItems.clear();
    update();
  }

  void decrementScore(BuildContext context){
    final profileController = Get.put(ProfileFormController());
    int totalPrice = 0;
    for (var i = 0; i < cardItems.length; i++) {
      totalPrice = totalPrice + cardItems[i].pointsPrice!;
    }
    if (profileController.currentUser!.fidelityPoints! < totalPrice) {
      showSnackBar("your score is not enough", context);
      return;
    }
    profileController.currentUser!.fidelityPoints = profileController.currentUser!.fidelityPoints! - totalPrice; 
    push(context, const InvoiceScreen());
    profileController.update();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController = ScrollController();
      scrollController.addListener(listenToScrollStatus);
      await getItems();
    });
    super.onInit();
  }
}