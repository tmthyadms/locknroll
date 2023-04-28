import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/buttons/elevated_btn.dart';
import '../../components/circular_progress.dart';
import '../../components/error_msg.dart';
import '../../components/gaps/hgap.dart';
import '../../components/gaps/vgap.dart';
import '../../components/navbar/current_index.dart';
import '../../models/user_model.dart';
import '../../services/user_details_service.dart';
import '../../theme/utils/color_palette.dart';
import '../../utils/constants.dart';
import 'component/user_details_tile.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final _auth = FirebaseAuth.instance;

  void signout() {
    context.read<CurrentIndex>().currentIndex = 0;
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Constants.bodyPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VGap.large(),

            // Build user
            FutureBuilder<UserModel?>(
              future: readUser(),
              builder: (context, snapshot) {
                final userModel = snapshot.data;
                if (snapshot.hasError) {
                  return ErrorMsg(msg: snapshot.toString());
                } else if (snapshot.hasData) {
                  return userModel == null
                      ? Center(child: ErrorMsg(msg: snapshot.toString()))
                      : buildUser(user: userModel);
                } else {
                  return const CustomCircularProgress();
                }
              },
            ),
            const VGap.large()
          ],
        ));
  }

  Widget buildUser({required UserModel user}) {
    final txtTheme = Theme.of(context).textTheme;
    final fullName = user.fullName;
    final dateRegistered = DateFormat.yMMMM().format(user.dateRegistered);
    final email = user.email;

    return Column(
      children: [
        Text(fullName, style: txtTheme.headlineMedium),
        const VGap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.workspace_premium_rounded),
            const HGap(),
            Text('Joined $dateRegistered', style: txtTheme.titleSmall)
          ],
        ),
        const VGap.medium(),
        Card(
            color: ColorPalette.background,
            elevation: 4,
            child: Padding(
              padding: Constants.defaultPadding,
              child: Column(
                children: [
                  UserDetailsTile(
                      icon: Icons.email_outlined, title: 'Email', detail: email)
                ],
              ),
            )),
        const VGap.large(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElevatedBtn(
                onPressed: () {},
                color: ColorPalette.darkError,
                name: 'delete me',
                icon: Icons.person_remove_outlined),
            CustomElevatedBtn(
                onPressed: signout,
                name: 'sign out',
                icon: Icons.logout_outlined)
          ],
        )
      ],
    );
  }
}
