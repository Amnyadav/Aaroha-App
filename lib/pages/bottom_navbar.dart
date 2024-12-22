import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:75.0,
      child:ClipRRect(
      
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30), // Rounded upper-left corner
        topRight: Radius.circular(30), // Rounded upper-right corner
      ),
      child: BottomNavigationBar(
        
        backgroundColor: lightMode.colorScheme.surfaceDim,
        selectedItemColor: Colors.white, // Color for selected item
        unselectedItemColor: const Color.fromARGB(145, 255, 255, 255), // Color for unselected items
        type: BottomNavigationBarType.fixed, 
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size:35), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.folder_copy_outlined,size:35), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.event_available_outlined,size:35), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism_outlined,size:35), label: 'Donate'),
        ],
      ),
    ),);
  }
}
