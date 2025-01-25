import 'package:flutter/material.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image asset paths
    final List<String> imagePaths = [
      'lib/images/R1.png',
      'lib/images/10r2.png',
      'lib/images/10r3.png',
      'lib/images/10r4.png',
      'lib/images/10r5.png',
      'lib/images/10r6.png',
      'lib/images/10r7.png',
      'lib/images/12r1.png',
      'lib/images/12r2.png'
      // Replace with your image file names

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: imagePaths.map((path) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
