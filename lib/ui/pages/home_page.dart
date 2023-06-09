import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/theme.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/upcoming.dart';
import 'package:movie_app/ui/pages/movie_details_page.dart';

import '../widgets/app_bar_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final MovieController _movieController = Get.find()..getUpComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
              child: Obx(() {
                return _movieController.isLoading.value
                    ? CircularProgressIndicator()
                    : EasyRefresh(
                        onRefresh: () async {
                          await _movieController.getUpComingMovies();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: kdPadding, vertical: kdPadding),
                          itemCount: _movieController.upcomingMovies.value!.totalResults,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Movie movie = _movieController.upcomingMovies.value!.results[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => MovieDetailsPage());
                              },
                              child: Container(
                                height: 180,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('https://picsum.photos/300/300?random=1'),
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(1),
                                        Colors.black.withOpacity(0),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: kdPadding),
                        ),
                      );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff2e2739),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BottomBarDefault(
          items: [
            TabItem(
              icon: Icons.dashboard,
              title: "Dashboard",
            ),
            TabItem(
              icon: Icons.video_camera_front_outlined,
              title: "Watch",
            ),
            TabItem(
              icon: Icons.my_library_music_outlined,
              title: "Media Library",
            ),
            TabItem(
              icon: Icons.list_rounded,
              title: "More",
            ),
          ],
          onTap: (index) {},
          indexSelected: 1,
          titleStyle: TextStyle(fontFamily: 'Poppins', fontSize: 8, fontWeight: FontWeight.w700),
          backgroundColor: Color(0xff2e2739),
          color: Color(0xff827d88),
          colorSelected: Colors.white,
        ),
      ),
    );
  }
}
