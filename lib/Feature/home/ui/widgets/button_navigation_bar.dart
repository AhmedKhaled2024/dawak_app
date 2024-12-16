import 'package:flutter/material.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({super.key});

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  int _currentIndex = 0;
  List<Widget>pages=const[
    Text('Home',style: _textStyle,),
    Text('medicine',style: _textStyle,),
    Text('Contact',style: _textStyle,),
    Text('profile',style: _textStyle,),
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Color(0xFFF5F5F5),
      selectedIndex: _currentIndex,
      onDestinationSelected:(int newIndex){
        setState(() {
          
          _currentIndex = newIndex;
        });
      } ,
      destinations:const [
        NavigationDestination(selectedIcon:Icon(Icons.person) ,icon: Icon(Icons.person_outlined), label: 'profile'),
        NavigationDestination(selectedIcon:Icon(Icons.message) ,icon: Icon(Icons.message_outlined), label: 'message'),
        NavigationDestination(selectedIcon:Icon(Icons.calendar_today) ,icon: Icon(Icons.calendar_today_outlined), label:'prescription'),
        NavigationDestination(selectedIcon:Icon(Icons.home) ,icon: Icon(Icons.home_outlined), label: 'home'),
        
       
        
        

      ],
    );
  }
}

const TextStyle _textStyle=TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
  
);


















// import 'package:flutter/material.dart';

// class ButtonNavigationBarHome extends StatelessWidget {
//   const ButtonNavigationBarHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       child:  BottomNavigationBar(
//         showSelectedLabels: true,
        
//        // backgroundColor: Colors.purple[200],
//         elevation: 16,
//         iconSize: 25,
//         items:const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.grey,), label: 'Home',),
//           BottomNavigationBarItem(icon: Icon(Icons.message_outlined,color: Colors.grey,), label: 'Messages'),
//           BottomNavigationBarItem(icon: Icon(Icons.search_outlined,size: 40,color: Colors.purple,), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today,color: Colors.grey,), label: 'Appointments'),
//           BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage('assets/images/person_icon.png')), label: 'Profile', ),
//         ],
//       ),
//     );
//   }
// }