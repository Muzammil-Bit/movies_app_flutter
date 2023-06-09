import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme.dart';

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
                    fillColor: kcGreyText.withOpacity(0.03),
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
                      color: kcGreyText,
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
                      borderSide: BorderSide(color: kcGreyText.withOpacity(0.03), width: 1),
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
