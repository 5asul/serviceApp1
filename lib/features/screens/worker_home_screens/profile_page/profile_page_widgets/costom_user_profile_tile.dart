import 'package:flutter/material.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';

class CostomUserProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? navRoot;
  const CostomUserProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.navRoot,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(navRoot!);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSize.height(context) * 0.01),
        child: Row(
          children: [
            Container(
              width: AppSize.width(context) * 0.17,
              height: AppSize.height(context) * 0.09,
              decoration: BoxDecoration(
                  color: ColorsTheme().secondary,
                  borderRadius:
                      BorderRadius.circular(AppSize.width(context) * 0.06)),
              child: Icon(
                icon,
                size: AppSize.width(context) * 0.1,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(context) * 0.05),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.width(context) * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
