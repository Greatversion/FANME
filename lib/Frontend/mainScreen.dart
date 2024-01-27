import 'package:fanme/AnimationsNav/slide.dart';
import 'package:fanme/Frontend/Reusable-frontEnd/cardList.dart';
import 'package:fanme/Frontend/promocard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fanme/Frontend/Reusable-frontEnd/drawerCustom.dart';
import 'package:fanme/Frontend/allCommunities.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _setCurrentUser();
  }

  Future<void> _setCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TopBar(user: _currentUser),
              const SearchInput(),
              const PromoCard(),
              const SizedBox(height: 15),
              const Headline(),
              const CardListView(),
              const SHeadline(),
              const CardListView2(),
            ],
          ),
        ),
      ),
      drawer: const DrawerCustom(),
    );
  }
}

class TopBar extends StatelessWidget {
  final User? user;

  const TopBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey , ",
                style: GoogleFonts.kanit(
                  // color: const Color.fromARGB(255, 188, 16, 4),
                  color: const Color.fromARGB(255, 200, 93, 0),
                  fontSize: 20,
                )),
            Text(
              user != null ? user!.displayName.toString() : '',
              style: GoogleFonts.kanit(
                // color: const Color.fromARGB(255, 188, 16, 4),
                color: const Color.fromARGB(255, 200, 93, 0),
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.25),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: CircleAvatar(
              backgroundImage: user != null
                  ? NetworkImage(user!.photoURL.toString())
                  : const AssetImage("placeholder_image.jpg") as ImageProvider,
              radius: 22,
              backgroundColor: const Color.fromARGB(255, 200, 93, 0),
            ),
          ),
        ),
      ],
    );
  }
}

// Other classes remain unchanged

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: const Color.fromARGB(255, 200, 93, 0).withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 200, 93, 0),
            hintText: 'Search',
            hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 214, 126, 1), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recently added",
              style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Pending Requests",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Text(
          "More",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SHeadline extends StatelessWidget {
  const SHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Communities Following",
              style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "The best for you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        TextButton(
          child: const Text("More"),
          onPressed: () {
            Navigator.of(context).push(
              SlidePageRoute(
                builder: (context) {
                  return const CommunityPage();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
