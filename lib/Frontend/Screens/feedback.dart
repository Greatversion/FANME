import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback Form',
          style: GoogleFonts.kanit(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 200, 93, 0),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _feedbackController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Enter your feedback here',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: ElevatedButton(
                onPressed: () {
                  _submitFeedback();
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback() {
    String feedback = _feedbackController.text;
    // Perform submission logic here, such as sending feedback to server or saving locally
    print('Feedback submitted: $feedback');

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Feedback Submitted'),
          content: const Text('Thank you for your feedback!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // Clear the text field after submission
    _feedbackController.clear();
  }
}
