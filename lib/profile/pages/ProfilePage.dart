import 'package:calmpulse/Emergencycontacts/pages/em_contact.dart';
import 'package:calmpulse/Screens/Login_Page.dart';
import 'package:calmpulse/profile/components/privacypolicy.dart';
import 'package:calmpulse/profile/components/terms.dart';
import 'package:calmpulse/profile/components/text_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginPage());
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 125.0),
          child: Column(
            children: [
              Row(
                children: [
                  Lottie.asset('assets/male-avatar.json',
                      height: Get.height / 8, width: Get.width / 4),
                  
                  SizedBox(
                    width: Get.width / 8,
                  ),
                  Text(
                    widget.username,
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 12,
              ),
              const TextBar(
                  text: 'Account', icon: Icons.navigate_next_outlined),
              GestureDetector(
                onTap: () => Get.to(EmergengyContact(),
                    transition: Transition.rightToLeft),
                child: const TextBar(
                    text: 'Emergency Contacts',
                    icon: Icons.navigate_next_outlined),
              ),
              const TextBar(
                  text: 'Language', icon: Icons.navigate_next_outlined),
              const TextBar(
                  text: 'Whats new', icon: Icons.navigate_next_outlined),
              const TextBar(text: 'FAQ', icon: Icons.navigate_next_outlined),
              GestureDetector(
                onTap: () =>
                    Get.to(MyTerms(), transition: Transition.rightToLeft),
                child: const TextBar(
                    text: 'Terms Of Service ',
                    icon: Icons.navigate_next_outlined),
              ),
              GestureDetector(
                onTap: () => Get.to(MyPrivacyPolicy(),
                    transition: Transition.rightToLeft),
                child: const TextBar(
                    text: 'Privacy Policy', icon: Icons.navigate_next_outlined),
              ),
              SizedBox(height: Get.height / 14),
              ElevatedButton(
                onPressed: _signOut,
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
