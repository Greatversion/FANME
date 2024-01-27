import 'package:fanme/AnimationsNav/slide.dart';
import 'package:fanme/Frontend/allApps.dart';
import 'package:fanme/Frontend/allCommunities.dart';
import 'package:fanme/Frontend/feedback.dart';
import 'package:fanme/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth user = FirebaseAuth.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googlesigin = GoogleSignIn();
    User? nuser = user.currentUser;

    Future<void> signOutGoogle() async {
      const Center(child: CircularProgressIndicator());
      await auth.signOut();
      await googlesigin.signOut();
    }

    return Drawer(
      shadowColor: Colors.black,
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 200, 93, 0)),
            accountName: Text(
              nuser!.displayName.toString().toUpperCase(),
              style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            accountEmail: Text(nuser.email.toString()),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(nuser.photoURL.toString()),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.white,
            ),
            title: const Text(
              'My Communities',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // Add your onTap logic for 'My Communities' here
              Navigator.of(context).push(
                SlidePageRoute(
                  builder: (context) {
                    // Return the widget for the new screen here
                    return const CommunityPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.lock_person,
              color: Colors.white,
            ),
            title: const Text(
              'Locked Applications',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // Add your onTap logic for 'Locked Applications' here
              Navigator.of(context).push(
                SlidePageRoute(
                  builder: (context) {
                    // Return the widget for the new screen here
                    return const AllDeviceApps();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // Add your onTap logic for 'Settings' here
              Navigator.of(context).push(
                SlidePageRoute(
                  builder: (context) {
                    // Return the widget for the new screen here
                    return const CommunityPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'FeedBack',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // Add your onTap logic for 'FeedBack' here
              Navigator.of(context).push(
                SlidePageRoute(
                  builder: (context) {
                    // Return the widget for the new screen here
                    return const FeedbackForm();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              signOutGoogle();
              if (auth.currentUser == null) {
                Navigator.popAndPushNamed(context, "login");
              }
            },
          ),
          const ListTile(
            leading: Text(""),
            title: Text(
              'version 0.0.1',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
