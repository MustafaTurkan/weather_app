import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/ui/ui.dart';

class CardTile extends StatelessWidget {
  const CardTile({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2.2,
      height: 100,
      child: Card(
        color: AppTheme.to.colors!.accent,
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: AppTheme.to.textStyles!.bodyL.copyWith(color: AppTheme.to.colors!.canvasPrimaryPale),
            ),
            body,
            const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
