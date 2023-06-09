import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/theme.dart';
import 'package:movie_app/ui/pages/home_page.dart';
import 'package:movie_app/ui/widgets/app_outlined_button.dart';

import '../widgets/app_button.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://picsum.photos/300/300?random=1'),
                ),
              ),
              child: Stack(
                children: [
                  _buildAppBar(context),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("In Theaters December 22, 2021", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: kcWhite)),
                          AppButton(title: "Get Tickets"),
                          AppOutlinedButton(
                            title: "Watch Trailer",
                            icon: Icons.play_arrow_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(kdPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Genres", style: Theme.of(context).textTheme.displayLarge),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (int i = 0; i < 10; i++)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: kcAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("HELLO", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kcWhite)),
                        ),
                    ],
                  ),
                  SizedBox(height: kdPadding),
                  Divider(),
                  Text("Overview", style: Theme.of(context).textTheme.displayLarge),
                  Text(
                    "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kdPadding, top: kdPadding),
      child: Row(
        children: [
          Navigator.canPop(context)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new, color: kcWhite),
                    visualDensity: VisualDensity.compact,
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            child: Text(
              "Watch",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
