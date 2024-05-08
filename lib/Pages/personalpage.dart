// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/constant/constant.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cc = Colorclass();
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: cc.background_color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.elliptical(60, 20),
                  bottomRight: Radius.elliptical(60, 20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2.48,
            child: Text(
              "Profile",
              style: cc.textstyle_normal,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.2,
            left: MediaQuery.of(context).size.width / 2.8,
            right: MediaQuery.of(context).size.width / 4.6,
            bottom: 50,
            child: Text(
              user.displayName!,
              style: cc.textstyle_normal_black_text,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5.6,
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
            child: CircleAvatar(
              maxRadius: 50,
              child: ClipOval(
                child: Image.network(
                  user.photoURL!,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.6,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: cc.white_color,
                        child: const Icon(
                          Icons.share,
                        ),
                      ),
                      title: Text(
                        'Share With Friends',
                        style: cc.textstyle_normal_black_text,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cc.white_color,
                      child: const Icon(
                        Icons.person,
                      ),
                    ),
                    title: Text(
                      'Account Info',
                      style: cc.textstyle_normal_black_text,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cc.white_color,
                      child: const Icon(
                        Icons.group,
                      ),
                    ),
                    title: Text(
                      'Personal Profile',
                      style: cc.textstyle_normal_black_text,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cc.white_color,
                      child: const Icon(
                        Icons.message,
                      ),
                    ),
                    title: Text(
                      'Message Center',
                      style: cc.textstyle_normal_black_text,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cc.white_color,
                      child: const Icon(
                        Icons.shield,
                      ),
                    ),
                    title: Text(
                      'Login And Security',
                      style: cc.textstyle_normal_black_text,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cc.white_color,
                      child: const Icon(
                        Icons.lock,
                      ),
                    ),
                    title: Text(
                      'Data And Privacy',
                      style: cc.textstyle_normal_black_text,
                    ),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
