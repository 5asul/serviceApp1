import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/email_authentication_screen.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/select_role_screen.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/user_register_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../state_managment/provider/service_app_provider.dart';

class DontHaveAnAccountRow extends StatelessWidget {
  const DontHaveAnAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceAppProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont\'t have an account',
        ),
        TextButton(
            onPressed: () {
              
              if (provider.isEmailVerified == false){
                Navigator.of(context).push(PageTransition(
                  child: EmailAuthenticationScreen(),
                  type: PageTransitionType.leftToRight));
              }
              else{
                Navigator.of(context).push(PageTransition(
                  child: SelectRoleScreen(),
                  type: PageTransitionType.leftToRight));
              }
            },
            child: Stack(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3.5
                        ..color = Colors.white54),
                ),
                Text(
                  'Register',
                  style: TextStyle(color: ColorsTheme().primary),
                ),
              ],
            ))
      ],
    );
  }
}
