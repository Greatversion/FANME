import 'package:flutter/material.dart';
import 'package:usage_stats/usage_stats.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently Launched App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
            
                },
                child: const Text("eeeee")),
            ElevatedButton(
              onPressed: () {
                // getAppFetch();
              },
              child: const Text('Get Last 5 Minutes App Launches'),
            ),
            const SizedBox(height: 20),
            const Text('Recently launched apps:'),
          ],
        ),
      ),
    );
  }
}
