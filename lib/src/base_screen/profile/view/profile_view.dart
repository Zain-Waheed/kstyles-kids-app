import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:todo/constant/constant.dart';



class ProfileView extends StatelessWidget {
  static String route = '/profile';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId: Constant.clientId,
        ),
        PhoneProviderConfiguration(),
      ],
      avatarSize: 24,
    );
  }
}
