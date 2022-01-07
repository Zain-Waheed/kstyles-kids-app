import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:todo/constant/constant.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
