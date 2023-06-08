import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/theme.dart';
import 'package:movie_app/ui/pages/movie_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: kdPadding, vertical: kdPadding),
                itemCount: 12,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
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
                        "Free Guy",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: kdPadding),
              ),
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

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    super.key,
  });

  final RxBool _shouldShowSearch = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(color: kcWhite),
          padding: EdgeInsets.symmetric(horizontal: kdPadding, vertical: 10),
          child: _shouldShowSearch.value
              ? TextField(
                  decoration: InputDecoration(
                    fillColor: kcGreyTextColor.withOpacity(0.03),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // prefixIconConstraints: BoxConstraints(minWidth: 70),
                    hintText: "TV shows, movies and more",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: kcGreyTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {
                          _shouldShowSearch.value = !_shouldShowSearch.value;
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kcGreyTextColor.withOpacity(0.03), width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )
              : Row(
                  children: [
                    Navigator.canPop(context)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(Icons.arrow_back_ios_new),
                              visualDensity: VisualDensity.compact,
                            ),
                          )
                        : SizedBox.shrink(),
                    Expanded(
                      child: Text(
                        "Watch",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _shouldShowSearch.value = !_shouldShowSearch.value;
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
