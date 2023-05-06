// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter_zoom_clone/resources/jitsi_meet_method.dart';

import '../widegts/Home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  // final JitsiMeeting _jitsiMeeting = JitsiMeeting();

  JoinMeet(BuildContext context){
    Navigator.pushNamed(context, '/Join');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMettingButton(
            onPressed: () async {
              // var random = Random();
              // String roomID = (random.nextInt(100000000) + 10000000).toString();
              // _jitsiMeeting.createNewMeeting(
              //     roomName: roomID, isAudioMuted: true, isVideoMuted: true);
            },
            text: "New Meeting",
            icon: Icons.videocam,
          ),
          HomeMettingButton(
            onPressed: ()=>JoinMeet(context),
            text: "Join Meeting",
            icon: Icons.add_box_rounded,
          ),
          HomeMettingButton(
            onPressed: () {},
            text: "Schedule Meeting",
            icon: Icons.calendar_today,
          ),
          HomeMettingButton(
            onPressed: () {},
            text: "Share Screen",
            icon: Icons.arrow_upward_rounded,
          ),
        ],
      ),
      const Expanded(
        child: Center(
          child: Text(
            'Create/Join meetings with just a click!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      // Text('Developed by Zain-Ul-Abdin',style: TextStyle(),),
      SizedBox(height: 2,)
    ]);
  }
}
