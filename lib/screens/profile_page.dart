import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_deliver/cubit/user_cubit.dart';
import 'package:quick_deliver/helper/constants.dart';
import 'package:quick_deliver/models/user_profile_model.dart';

class ProfilePage extends StatelessWidget {
  final String token;

  const ProfilePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getProfile(token);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              FontAwesomeIcons.angleLeft,
              color: Color.fromARGB(255, 18, 42, 82),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                FontAwesomeIcons.idCard,
                color: Color.fromARGB(255, 37, 65, 109),
                size: 32,
              ),
            ),
          ],
          title: const Text(
            'My Profile ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 18, 42, 82),
            ),
          ),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccess) {
              final userProfile = state.userProfile;
              return buildProfileDetails(userProfile);
            } else if (state is ProfileFailure) {
              return Center(
                child: Text(
                  'Error: ${state.errorMessage}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 173, 91, 3),
                      fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  Widget buildProfileDetails(UserProfile userProfile) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: DrawerHeader(
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: kListColor)),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 82,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(userProfile.profileImage),
                      radius: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Text(
            "${userProfile.firstName} ${userProfile.lastName}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 18, 42, 82),
            ),
          ),
        ),
        const SizedBox(height: 15),
        profileDetail('First Name:', userProfile.firstName),
        profileDetail('Last Name:', userProfile.lastName),
        profileDetail('Phone Number:', userProfile.phoneNumber),
        profileDetail('Location:', userProfile.location),
      ],
    );
  }

  Widget profileDetail(String title, String value) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 18, 42, 82),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 42, 82),
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Divider(
          color: Color.fromARGB(255, 173, 91, 3),
          endIndent: 25,
          indent: 25,
          thickness: 1,
        ),
      ],
    );
  }
}
