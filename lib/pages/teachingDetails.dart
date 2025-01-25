import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// class AuthGuard extends StatelessWidget {
//   final Widget child;
//
//   AuthGuard({required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasData) {
//           // User is logged in
//           return child;
//         } else {
//           // User is not logged in, redirect to login page
//
//           return LoginPage();
//         }
//       },
//     );
//   }
// }

class TeachingDetails extends StatelessWidget {
  final TextEditingController topicController = TextEditingController();
  final TextEditingController studentsController = TextEditingController();
  final TextEditingController teacherController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final String volunteerId = "volunteer123"; // Replace with actual volunteer ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teaching Details",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeachingDetailsPage(),
                  ),
                );
              },
              child: const Text("View Yesterday's Data"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Today's Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: topicController,
              decoration: const InputDecoration(labelText: "Topic"),
            ),
            TextFormField(
              controller: studentsController,
              decoration: const InputDecoration(labelText: "Students (comma-separated)"),
            ),
            TextFormField(
              controller: teacherController,
              decoration: const InputDecoration(labelText: "Taught by"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  selectedDate = pickedDate;
                }
              },
              child: Text("Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Validation checks for empty fields
                if (topicController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error: Topic cannot be empty')),
                  );
                  return;
                }

                if (studentsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error: Students field cannot be empty')),
                  );
                  return;
                }

                if (teacherController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error: Taught by field cannot be empty')),
                  );
                  return;
                }

                try {
                  // Save teaching details to Firestore
                  await firestore.collection('teachingDetails').add({
                    'volunteerId': volunteerId,
                    'volunteerName': teacherController.text,
                    'topic': topicController.text,
                    'students': studentsController.text.split(',').map((e) => e.trim()).toList(),
                    'date': selectedDate.toIso8601String(),
                  });

                  // Save attendance to Firestore
                  await firestore.collection('attendance').add({
                    'volunteerId': volunteerId,
                    'volunteerName': teacherController.text,
                    'date': selectedDate.toIso8601String(),
                    'status': 'Present',
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Details saved and attendance marked!')),
                  );

                  // Clear input fields
                  topicController.clear();
                  studentsController.clear();
                  teacherController.clear();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },
              child: const Text("Save Details"),
            ),
          ],
        ),
      ),
      );

  }
}

class TeachingDetailsPage extends StatefulWidget {
  const TeachingDetailsPage({Key? key}) : super(key: key);

  @override
  _TeachingDetailsPageState createState() => _TeachingDetailsPageState();
}

class _TeachingDetailsPageState extends State<TeachingDetailsPage> {
  List<Map<String, dynamic>> _teachingDetails = []; // Store the fetched entries
  bool _isLoading = false; // Show loading indicator when fetching data

  // Function to fetch the last 3 entries from Firestore
  Future<void> fetchLastThreeEntries() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final firestore = FirebaseFirestore.instance;
      final querySnapshot = await firestore
          .collection('teachingDetails') // Your collection name
          .orderBy('date', descending: true) // Order by the date field
          .limit(3) // Limit to the last 3 entries
          .get();

      final entries = querySnapshot.docs.map((doc) {
        return {'id': doc.id, ...doc.data() as Map<String, dynamic>};
      }).toList();

      setState(() {
        _teachingDetails = entries;
      });
    } catch (e) {
      print('Error fetching teaching details: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teaching Details',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Button to fetch entries
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: fetchLastThreeEntries,
              child: const Text('Show Last 3 Entries'),
            ),
          ),

          // Show loading indicator
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),

          // Display entries in a ListView
          Expanded(
            child: _teachingDetails.isEmpty
                ? const Center(
              child: Text('No entries to show'),
            )
                : ListView.builder(
              itemCount: _teachingDetails.length,
              itemBuilder: (context, index) {
                final entry = _teachingDetails[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      'Topic: ${entry['topic'] ?? 'No Topic'}',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Volunteer: ${entry['volunteerName'] ?? 'Unknown'}'),
                        Text('Students: ${entry['students']?.join(', ') ?? 'None'}'),
                        Text('Date: ${entry['date'] ?? 'No Date'}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
