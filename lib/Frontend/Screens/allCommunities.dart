import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final CollectionReference<Map<String, dynamic>> _communityCollection =
      FirebaseFirestore.instance.collection('community');

  List<Community> communityList = [];

  @override
  void initState() {
    super.initState();
    _loadCommunityData();
  }

  Future<void> _loadCommunityData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _communityCollection.get();
    setState(() {
      communityList =
          snapshot.docs.map((doc) => Community.fromMap(doc.data())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.people),
        actions: [
          IconButton(
            onPressed: () {
              _showRenameDialog();
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 200, 93, 0),
        title: Text(
          "Communities",
          style: GoogleFonts.kanit(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:  Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: communityList.length,
                  itemBuilder: (context, index) {
                    return VerticalCard(
                      community: communityList[index],
                    );
                  },
                ),
              ),
            ),
    );
  }

  void _showRenameDialog() {
    String newName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Community'),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
            decoration: const InputDecoration(hintText: 'Enter community name'),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (newName.isNotEmpty) {
                  await _addCommunity(newName);
                  _loadCommunityData();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addCommunity(String name) async {
    await _communityCollection.add({
      'name': name,
      'imageUrl': 'assets/crowd.png', // Default image URL
      'subtitle': '0 members', // Default subtitle
    });
  }
}

class Community {
  final String text;
  final String imageUrl;
  final String subtitle;

  Community(this.text, this.imageUrl, this.subtitle);

  factory Community.fromMap(Map<String, dynamic> map) {
    return Community(
      map['name'] ?? '',
      map['imageUrl'] ?? '',
      map['subtitle'] ?? '',
    );
  }
}

class VerticalCard extends StatelessWidget {
  final Community community;

  const VerticalCard({
    Key? key,
    required this.community,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: 25,
        height: 45,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 93, 0),
          borderRadius: BorderRadius.circular(5.5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 20),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.white.withOpacity(.01),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  community.imageUrl,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Text(
                  community.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Text(
              community.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
