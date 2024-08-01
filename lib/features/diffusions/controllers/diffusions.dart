import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/movie.dart';

class DiffusionsController extends GetxController {
  late List<Movie> movies;

  void initMoviesList() {
    movies = [
      Movie(
        title: "AVATAR 2",
        posterUrl: "https://via.placeholder.com/50",
        genres: ["Action", "Adventure"],
        trailer: Trailer(
          title: "AVATAR 2", 
          trailerUrl: "https://www.youtube.com/watch?v=d9MyW72ELq0",
          isOriginal: true
        ),
        selectColor: const Color(0xFFF4C048),
        backgroundColor: const Color(0xFFFFF9D8),
      ),
      Movie(
        title: "Deadpool",
        posterUrl: "https://via.placeholder.com/50",
        genres: ["Comedy", "Action"],
        trailer: Trailer(
          title: "Deadpool", 
          trailerUrl: "https://www.youtube.com/watch?v=ONHBaC-pfsk",
          isOriginal: true
        ),
        selectColor: const Color(0xFFCF3768),
        backgroundColor: const Color(0xFFFCD6E1),
      ),
      Movie(
        title: "COCO",
        posterUrl: "https://via.placeholder.com/50",
        genres: ["Animation", "Family"],
        trailer: Trailer(
          title: "COCO", 
          trailerUrl: "https://www.youtube.com/watch?v=Ga6RYejo6Hk",
          isOriginal: true
        ),
        selectColor: const Color(0xFF3B3CC8),
        backgroundColor: const Color(0xFFC5D0E4),
      ),
      Movie(
        title: "Spiderman: Into The Spiderverse",
        posterUrl: "https://via.placeholder.com/50",
        genres: ["Animation", "Action"],
        trailer: Trailer(
          title: "Spiderman: Into The Spiderverse", 
          trailerUrl: "https://www.youtube.com/watch?v=g4Hbz2jLxvQ",
          isOriginal: true
        ),
        selectColor: const Color(0xFF5AC78D),
        backgroundColor: const Color(0xFFD1EDD6),
      ),
      Movie(
        title: "Oppenheimer",
        posterUrl: "https://via.placeholder.com/50",
        genres: ["Biography", "Drama"],
        trailer: Trailer(
          title: "Oppenheimer", 
          trailerUrl: "https://www.youtube.com/watch?v=bK6ldnjE3Y0",
          isOriginal: true
        ),
        selectColor: const Color(0xFF4FCEEA),
        backgroundColor: const Color(0xFFCAF0FD),
      ),
      // Add more movies here
    ];
  }

  void removeMovie(int index){
    movies.removeAt(index);
    update();
  }

  late List<Trailer> trailers;
  void initializeTrailersList(){
    trailers = [
      Trailer(
        title: "AVATAR 2",
        trailerUrl: "https://www.youtube.com/watch?v=d9MyW72ELq0",
        isOriginal: true
      ),
      Trailer(
        title: "Deadpool",
        trailerUrl: "https://www.youtube.com/watch?v=ONHBaC-pfsk",
        isOriginal: false
      ),
      Trailer(
        title: "COCO",
        trailerUrl: "https://www.youtube.com/watch?v=Ga6RYejo6Hk",
        isOriginal: true
      ),
      Trailer(
        title: "Spiderman: Into The Spiderverse",
        trailerUrl: "https://www.youtube.com/watch?v=g4Hbz2jLxvQ",
        isOriginal: false
      ),
      Trailer(
        title: "Oppenheimer",
        trailerUrl: "https://www.youtube.com/watch?v=bK6ldnjE3Y0",
        isOriginal: true
      ),
    ];
  }

  late Map<String, List<Movie?>> schedule;
  late List<String> slotsRanges;

  void initializeCurrentDiffusions(){
    initializeSlotsRanges();
    final slotsNumber = slotsRanges.length - 1;
    schedule = {
      "Sunday": List.generate(slotsNumber, (_) => null),
      "Monday": List.generate(slotsNumber, (_) => null),
      "Tuesday": List.generate(slotsNumber, (_) => null),
      "Wednesday": List.generate(slotsNumber, (_) => null),
      "Thuresday": List.generate(slotsNumber, (_) => null),
      "Friday": List.generate(slotsNumber, (_) => null),
      "Saturday": List.generate(slotsNumber, (_) => null),
    };
  }

  void initializeSlotsRanges(){
    slotsRanges = ["10AM", "01PM", "04PM", "08PM", "11PM"];
  }

  void addDuffusion({
    required String diffusionDay,
    required int diffusionIndex, 
    required Movie movie
  }){
    final chosenDiffusionDay = schedule[diffusionDay];
    if (diffusionIndex >= 0 &&
      diffusionIndex <= 3 && 
      chosenDiffusionDay != null && 
      chosenDiffusionDay[diffusionIndex] == null) {
      schedule[diffusionDay]![diffusionIndex] = movie;
      update();
    }
  }

  void removeDiffusion({
    required String diffusionDay,
    required int diffusionIndex,
  }){
    final chosenDiffusionDay = schedule[diffusionDay];
    if (diffusionIndex >= 0 &&
      diffusionIndex <= 3 && 
      chosenDiffusionDay != null && 
      chosenDiffusionDay[diffusionIndex] != null) {
      schedule[diffusionDay]![diffusionIndex] = null;
      update();
    }
  }

  final moviesScrollController = ScrollController();
  var isScrollOffsetMaximum = false;

  void listenToMoviesScrollContoller(){
    if (moviesScrollController.offset == moviesScrollController.position.maxScrollExtent) {
      isScrollOffsetMaximum = true;
    } else {
      isScrollOffsetMaximum = false;
    }
    update();
  }

  @override
  void onInit() {
    initMoviesList();
    initializeTrailersList();
    initializeCurrentDiffusions();
    WidgetsBinding.instance.addPostFrameCallback((_){
      moviesScrollController.addListener(listenToMoviesScrollContoller);
    });
    super.onInit();
  }
}