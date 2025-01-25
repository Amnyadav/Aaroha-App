import 'package:aaroha/components/app_bar.dart';
import 'package:aaroha/components/app_drawer1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: PreferredSize(preferredSize: const Size.fromHeight(90),
        child: CustomAppBar(
          title: "Donate",
          titleTheme: Theme.of(context).textTheme.titleLarge,
          iconColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 420,
            child: DonationCard(
              title: "Support Our Cause",
              description: "Your donation helps us provide essential resources to those in need.",
              qrData: "https://your-donation-link.com", // Replace with your actual donation link
            ),
          ),
        ),
      )
    );
  }
}

class DonationCard extends StatelessWidget {
  final String title;
  final String description;
  final String qrData;

  const DonationCard({
    required this.title,
    required this.description,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title with rounded decoration
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF187B9D),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // QR Code
            Image.asset(
              "lib/images/qrAaroha.jpg",
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Description
            Column(
              children: [
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8), // Add some space between the texts
                Text(
                  "UPI ID: mab.037122010480282@axisbank", // New line for UPI ID
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18, // Bigger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Add a button to copy UPI ID
                TextButton(
                  onPressed: () {
                    // Copy UPI ID to clipboard
                    Clipboard.setData(const ClipboardData(text: "mab.037122010480282@axisbank"));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("UPI ID copied to clipboard!")),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white, // Change to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Make the button rounded
                    ),
                  ),
                  child: const Text(
                    "Copy UPI ID",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20, // Increase font size
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
