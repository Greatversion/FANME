import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final GoogleSignIn _googleSignIn;
  late final FirebaseAuth _auth;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn();
    _auth = FirebaseAuth.instance;
  }

  Future<User?> signInWithGoogle() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in with the credential
        final userCredential = await _auth.signInWithCredential(credential);

        // Get the user data from the userCredential
        final user = userCredential.user;

        if (user != null) {
          // Navigate to the home screen after successful login
          // ignore: use_build_context_synchronously
          Navigator.popAndPushNamed(context, "main");
        }

        return user;
      } else {
        setState(() {
          isLoading = false; // Hide loading indicator
        });
        return null;
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
      // Handle error (e.g., display error message)
      print('Error signing in with Google: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: const Center(child: CircularProgressIndicator()),
            ) // Show loading indicator
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  children: [
                    Image.asset("assets/lock.png"),
                    Text(
                      "Help , Collaborate , Groww",
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset("assets/logo.png"),
                    Text(
                      '" FANME "',
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Friends are no more Enemies',
                      style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SignInButton(
                      Buttons.GoogleDark,
                      onPressed: signInWithGoogle,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
