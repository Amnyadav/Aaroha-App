import 'package:flutter/material.dart';

import '../theme/theme.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor:lightMode.colorScheme.surface,
      child: Column(
        children: [
          // Drawer header
          Container(
            
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            height:200,
            color: lightMode.scaffoldBackgroundColor,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color:lightMode.cardColor,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Harsh',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: lightMode.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Dashboard
          ListTile(
            leading: Icon(Icons.dashboard,size:30,color: lightMode.colorScheme.primary,),
            title: Text('Dashboard',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: lightMode.colorScheme.secondary),),
            onTap: () {
              // Navigator.pop(context);
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),

          
        

          // Chapters
          ListTile(
            leading: Icon(Icons.diversity_3,size:30,color: lightMode.colorScheme.primary,),
            title: Text('Chapters',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: lightMode.colorScheme.secondary),),
            onTap: () {
              Navigator.of(context).pushNamed('/chapters');
            },
          ),

          // Team
          ListTile(
            leading: Icon(Icons.group,size:30,color: lightMode.colorScheme.primary,),
            title: Text('Team',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: lightMode.colorScheme.secondary),),
            onTap: () {
              Navigator.of(context).pushNamed('/team');
            },
          ),

          // Settings
          ListTile(
            leading: Icon(Icons.settings,size:30,color: lightMode.colorScheme.primary,),
            title: Text('Settings',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: lightMode.colorScheme.secondary),),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),

          Spacer(flex:5), // Pushes the logout button to the bottom

          // Logout feature
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black,size:30),
            title: Text('Log Out', style: TextStyle(color:Color(0xFF812204),fontSize: 25,fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
          Spacer(flex:1),
        ],
      ),
    );
  }
}
