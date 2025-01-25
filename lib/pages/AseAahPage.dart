import 'package:flutter/material.dart';

class ASeAahPage extends StatelessWidget {
  const ASeAahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A Se Aah Event'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality if needed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://aaroha.org.in/images/_MG_6221.JPG', // Replace with your event image URL
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Tag
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Event 09/02/2025',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Title
              const Text(
                'A Se Aah: Inspiring Creative Learning',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Description
              const Text(
                'A Se Aah is an event dedicated to fostering creativity and engagement among students. '
                    'The event includes workshops, interactive sessions, and guest lectures aimed at empowering young minds. '
                    'Join us on February 9, 2025, for an unforgettable experience that combines fun with learning.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              // Additional details
              const Text(
                'Highlights:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Creative workshops\n'
                    '- Inspiring keynote speeches\n'
                    '- Interactive sessions to boost innovation\n'
                    '- Opportunities for networking and collaboration',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
