
import 'package:aaroha/theme/theme.dart';
import 'package:flutter/material.dart';
import '../components/app_drawer1.dart';
// import '../components/app_bar.dart';
// import '../components/bottom_navbar.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // bottomNavigationBar: const CustomBottomBar(),
      drawer: const AppDrawer(),

      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
// app drawer
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  "Team",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () {
                        // Use context.findAncestorStateOfType<ScaffoldState>()
                        final scaffoldState =
                            context.findAncestorStateOfType<ScaffoldState>();
                        scaffoldState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                      iconSize: 48,
                      color: Theme.of(context).colorScheme.primary,
                    );
                  },
                ),
              ),
            ),

            // Content Section
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                children: const [
                  ChapterCard(
                    title: 'AIIMS',
                    description:
                        'AIIMS provides necessary medicines and healthcare accessories to underprivileged children, ensuring their well-being.',
                    photoPlaceholder: 'lib/images/health.png',
                  ),
                  ChapterCard(
                    title: 'MANIT',
                    description:
                        'MANIT focuses on providing education to underprivileged students, helping them achieve their dreams through quality learning.',
                    photoPlaceholder: 'lib/images/education.jpg',
                  ),
                  ChapterCard(
                    title: 'IHM',
                    description:
                        'IHM contributes by offering healthy and nutritious food to children, combating hunger and malnutrition.',
                    photoPlaceholder: 'lib/images/food.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String title;
  final String description;
  final String photoPlaceholder;

  const ChapterCard({
    required this.title,
    required this.description,
    required this.photoPlaceholder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color:Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01, // Dynamic vertical spacing
      ),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.25, // Dynamic card height
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              image: DecorationImage(
                image: AssetImage(photoPlaceholder),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Dynamic font size
                    color: lightMode.colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01), // Dynamic spacing
                Text(
                  description,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Dynamic font size
                    color: lightMode.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
