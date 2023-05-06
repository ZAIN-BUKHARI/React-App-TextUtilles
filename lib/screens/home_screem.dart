import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/screens/contacts_screen.dart';
import 'package:flutter_zoom_clone/screens/setting.dart';
// import 'package:flutter_zoom_clone/screens/Meeting_screen.dart';
// import 'package:flutter_zoom_clone/screens/history_screen.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';

import 'Meeting_screen.dart';
import 'history_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  List<Widget> pages = [
     MeetingScreen(),
    const HistoryMeetingScreen(),
    const Contact(),
    Setting(),
  ];
  int _page = 0;
  onPagaeChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NAVBAR
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),
      // Body
      body: pages[_page],
      // FOOTER
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: footerColor,
        currentIndex: _page,
        onTap: onPagaeChanged,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & Char',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// class HistoryMeeting extends StatelessWidget {
//   const HistoryMeeting({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             HomeMettingButton(onPressed: (){},text: "New Meeting",icon: Icons.videocam,),
//             HomeMettingButton(onPressed: (){},text: "Join Meeting",icon: Icons.add_box_rounded,),
//             HomeMettingButton(onPressed: (){},text: "Schedule Meeting",icon: Icons.calendar_today,),
//             HomeMettingButton(onPressed: (){},text: "Share Screen",icon: Icons.arrow_upward_rounded,),
//           ],
//         ),
//         const Expanded(child: Center(child: Text('Create/Join meetings with just a click!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),),),
//       ]
//       );
//   }
// }
