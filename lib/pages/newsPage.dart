import 'package:flutter/material.dart';
import 'package:aaroha/pages/AseAahPage.dart';
import 'package:aaroha/pages/FR.dart';
import 'package:aaroha/pages/news_1.dart';
import 'package:aaroha/pages/resultPage.dart';
import 'package:aaroha/components/app_bar.dart';
import 'package:aaroha/components/app_drawer1.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(
          title: "News",
          titleTheme: Theme.of(context).textTheme.titleLarge,
          iconColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              NewsCard(
                imagePath: 'lib/images/akshar.jpg',
                title: "Praised by the Education Ministry of India",
                date: "8 Feb, 2024",
                gradientColors: [Colors.blue.shade200, Colors.blue.shade400],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const News1(),
                  ),
                ),
              ),
              NewsCard(
                imagePath: 'lib/images/fund_raising.jpg',
                title: "Upcoming Event: Fund Raising",
                date: "26 Jan, 2025",
                gradientColors: [Colors.pink.shade200, Colors.pink.shade400],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FRPage(),
                  ),
                ),
              ),
              NewsCard(
                imagePath: 'lib/images/aakar.jpg',
                title: "Upcoming Event: A se Aah",
                date: "9 Feb, 2025",
                gradientColors: [Colors.orange.shade200, Colors.orange.shade400],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ASeAahPage(),
                  ),
                ),
              ),
              NewsCard(
                imagePath: 'lib/images/a_se_ah.jpg',
                title: "Results of 10th and 12th Students",
                date: "",
                gradientColors: [Colors.green.shade200, Colors.green.shade400],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AchievementPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final VoidCallback onTap;
  final List<Color> gradientColors;

  const NewsCard({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.onTap,
    required this.gradientColors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: 140,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
