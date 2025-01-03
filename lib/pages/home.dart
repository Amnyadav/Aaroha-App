import 'package:aaroha/components/app_bar.dart';
import 'package:aaroha/components/app_drawer1.dart';
import 'package:aaroha/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
        bottomNavigationBar: const CustomBottomBar(),
      body: const Column(
        children: [
          Expanded(
            child: HomePage(),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
               Container(
  height: screenHeight * 0.3,
  width: double.infinity,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 1), // Add padding below the image
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Transform.translate(
        offset: const Offset(0, -5), // Move the image 10 pixels up
        child: Image.asset(
          'lib/images/home.jpg',
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(.3),
          colorBlendMode: BlendMode.darken,
        ),
      ),
    ),
  ),
),


                //App Bar
                CustomAppBar(
                  title: "AAROHA",
                  titleTheme: Theme.of(context).textTheme.headlineLarge,
                  iconColor: Theme.of(context).colorScheme.tertiary,
                ),
                const Positioned(
                  bottom: 25,
                  left: 0,
                  right: 0,
                  top: 215,
                  child: Text(
                    'Together We can create A World of Change',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black45,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      'Mission',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'आरोह तमसो ज्योतिः',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'As students our heart beats for only one accomplishment. We want to embellish the lives of every single child who is deprived of its basic needs i.e., right to education and nutritious food. Overall development of the poor children is what makes this organisation stand with strength.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'What we do?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We believe that we can save more lives with you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.restaurant,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 22),
                                const SizedBox(width: 6),
                                Text(
                                  'HEALTHY FOOD',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'At Aaroha, we strive to combat hunger and malnutrition by providing nutritious meals to underprivileged children, promoting their growth and well-being.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.health_and_safety,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 22),
                                const SizedBox(width: 6),
                                Text(
                                  'HEALTH CARE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Aaroha prioritizes the health of underprivileged children, offering medical assistance, check-ups, and essential healthcare services to nurture their physical well-being.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.school,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 22),
                                const SizedBox(width: 6),
                                Text(
                                  'EDUCATION',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Education is a pathway to a better future. Aaroha empowers disadvantaged children through quality primary education, unlocking their potential and dreams.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.people,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 22),
                                SizedBox(width: 6),
                                Text(
                                  'SOCIAL CARE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Aaroha provides a caring and nurturing environment, fostering emotional and social development, ensuring every child feels valued and supported.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
