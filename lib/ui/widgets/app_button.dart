import 'package:flutter/material.dart';

import '../../config/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => kcAccent),
          // padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(color: kcWhite),
        ),
      ),
    );
  }
}
