import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/cubit/user_cubit.dart';
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/screens/my_request.dart';
import 'package:quick_deliver/screens/profile_page.dart';
import 'package:quick_deliver/widgets/custom_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 18, 42, 82),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 220,
            child: DrawerHeader(
              padding: EdgeInsets.only(left: 20, top: 70),
              decoration:
                  BoxDecoration(gradient: LinearGradient(colors: kListColor)),
              child: Text(
                'Settings',
                style: TextStyle(
                  shadows: [
                    BoxShadow(
                        color: Color.fromARGB(255, 251, 131, 3),
                        blurRadius: 30,
                        spreadRadius: 20)
                  ],
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          ListTile(
              leading: const Icon(FontAwesomeIcons.idCard,
                  color: Colors.white, size: 32),
              title: const Text('My Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ProfilePage(
                      token:
                          '15|pVEH7KbSaCo00mnh01vSuqPnoz3RQaHosuHPAn15de68b862',
                    );
                  },
                ));
              }),
          const SizedBox(height: 35),
          ListTile(
              leading: const Icon(FontAwesomeIcons.gratipay,
                  color: Colors.white, size: 32),
              title: const Text('My Favorites',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {}),
          const SizedBox(height: 35),
          ListTile(
              leading: const Icon(FontAwesomeIcons.jediOrder,
                  color: Colors.white, size: 32),
              title: const Text('My Requests',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyRequest();
                }));
              }),
          const SizedBox(height: 35),
          ListTile(
              leading: const Icon(FontAwesomeIcons.globe,
                  color: Colors.white, size: 32),
              title: const Text('Language',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {}),
          const SizedBox(height: 60),
          Center(
            child: CustomButton(
                text: 'Log Out',
                height: 62,
                width: 170,
                color: const [
                  Color.fromARGB(255, 111, 165, 252),
                  Color.fromARGB(255, 37, 65, 109),
                ],
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            var token = EndPoint.userToken;
                            context.read<UserCubit>().logout(token);
                            Navigator.pop(context);
                          },
                          child: const Text('Log Out'),
                        ),
                      ],
                    ),
                  );
                },
                colorText: Colors.white),
          )
        ],
      ),
    );
  }
}
