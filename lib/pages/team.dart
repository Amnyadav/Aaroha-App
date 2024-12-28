import 'package:flutter/material.dart';
import '../../components/app_drawer1.dart';
import '../../theme/theme.dart';


class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of team members with their names, designations, and image paths
    final List<Map<String, String>> teamMembers = [
      {'name': 'Shreenivas', 'designation': 'Founder & President', 'photo': 'lib/images/president.jpg'},
      {'name': 'Ashish Sharma', 'designation': 'Vice President & Strategist', 'photo': 'lib/images/vicepresident.jpg'},
      {'name': 'Triveni Naidu', 'designation': 'Projects & Comm. Manager', 'photo': 'lib/images/projectmanager.jpg'},
      {'name': 'Satvik Sharma', 'designation': 'Lead Human Resources', 'photo': 'lib/images/humanlead.jpg'},
      {'name': 'Surbhi Gaharwar', 'designation': 'Chief Finance Manager', 'photo': 'lib/images/financemanager.jpg'},
      {'name': 'Satyam Vada', 'designation': 'Chapter Coordinator', 'photo': 'lib/images/chaptercoordinator.jpg'},
      {'name': 'Shruti Saksena', 'designation': 'Lead Design & Marketing', 'photo': 'lib/images/designlead.jpg'},
      {'name': 'Simaran', 'designation': 'AIIMS Chapter Head', 'photo': 'lib/images/aimmslead.jpg'},
      {'name': 'Kshitij Raj', 'designation': 'MANIT Chapter Head', 'photo': 'lib/images/manitlead.jpg'},
      {'name': 'Khusi Shrivastav', 'designation': 'IHM Chapter Head', 'photo': 'lib/images/ihmlead.jpg'},
    ];

    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        color: lightMode.scaffoldBackgroundColor, // Set the background color for the main body
        child: Column(
          children: [
            // Header Section
            Container(
              color: lightMode.scaffoldBackgroundColor, // Background color for the header
              padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
              child: Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: lightMode.colorScheme.primary,
                        size: 40,
                      ),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(width:MediaQuery.of(context).size.width * 0.2),
                  Text(
                    "Team",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Team Member Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: teamMembers.length,
                  itemBuilder: (context, index) {
                    final member = teamMembers[index];
                    return TeamMemberCard(
                      name: member['name']!,
                      designation: member['designation']!,
                      photoPlaceholder: member['photo']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String designation;
  final String photoPlaceholder;

  const TeamMemberCard({
    required this.name,
    required this.designation,
    required this.photoPlaceholder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightMode.scaffoldBackgroundColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150.0,
            width: 140.0,
            margin: const EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(photoPlaceholder),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            designation,
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
