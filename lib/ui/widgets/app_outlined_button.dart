import 'package:flutter/material.dart';

import '../../config/theme.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.title,
    this.icon,
  });
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1, color: kcAccent),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(icon, color: kcWhite, size: 14),
                  ),
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(color: kcWhite),
            ),
          ],
        ),
      ),
    );
  }
}
