import 'package:get/get.dart';
import 'package:movie_app/helpers/api_helper.dart';

import '../models/upcoming.dart';

class MovieController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<Upcoming?> upcomingMovies = Rx(null);

  getUpComingMovies() async {
    isLoading(true);
    try {
      var response = await ApiHelper.get(url: '/movie/upcoming', isProtected: true);
      upcomingMovies.value = Upcoming.fromMap(response);
    } catch (e) {
      print("API ERROR :: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
