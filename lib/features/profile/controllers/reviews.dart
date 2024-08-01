import "package:flutter/material.dart";
import "package:get/get.dart";

class ReviewsController extends GetxController {
  final reviews = [
    Review(
        rate: 3.5,
        review:
            'Very comfortable seats, fresh drinks and big screen! Best cinema I’ve ever been to!!',
        reviewer: 'Lamia Bakli (@lam.exe_failed)',
        time: '2 min ago'),
    Review(
        rate: 4,
        review:
            'Very comfortable seats, fresh drinks and big screen! Best cinema I’ve ever been to!!',
        reviewer: 'Lamia Bakli (@lam.exe_failed)',
        time: '2 days ago'),
    Review(
        rate: 3.6,
        review:
            'Very comfortable seats, fresh drinks and big screen! Best cinema I’ve ever been to!!',
        reviewer: 'John Doe (@john_doe123)',
        time: '2 min ago'),
    Review(
        rate: 3.9,
        review:
            'Very comfortable seats, fresh drinks and big screen! Best cinema I’ve ever been to!!',
        reviewer: 'Alice Smith (@alice_smith)',
        time: '2 min ago'),
    Review(
        rate: 4.1,
        review:
            'Very comfortable seats, fresh drinks and big screen! Best cinema I’ve ever been to!!',
        reviewer: 'Bob Johnson (@bob_johnson)',
        time: '2 min ago')
  ];

  double rate = 0;
  final reviewContent = TextEditingController();

  void addReview() {
    reviews.add(Review(
        rate: rate,
        review: reviewContent.text.trim(),
        reviewer: "Ouchene Mohamed (@mooh_ouch)",
        time: '1 second ago'));
    reviewContent.text = '';
    rate = 0;
    update();
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void updateRate(double newValue) {
    rate = newValue;
    update();
  }

  final scrollController = ScrollController();
}

class Review {
  final String reviewer;
  final String review;
  final double rate;
  final String time;
  Review(
      {required this.rate,
      required this.review,
      required this.reviewer,
      required this.time});
}
