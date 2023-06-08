import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/home_page.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                  Positioned(
                    child: AppBarWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
