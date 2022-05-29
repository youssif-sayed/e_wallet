import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async{
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushNamed('PROFILE');
      },
      icon: const Icon(
        Icons.person_rounded,
        color: Color(0xff6FC3E7),
      ),
      label: const Text(
        '',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
