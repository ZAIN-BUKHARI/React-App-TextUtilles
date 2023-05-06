import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';
import 'package:flutter_zoom_clone/widegts/meet_option.dart';
// import 'package:jitsi_meet_fix/jitsi_meet.dart';

// import '../resources/jitsi_meet_method.dart';

class JoinMeet extends StatefulWidget {
  // static String routeName = '/Join';
  const JoinMeet({super.key});

  @override
  State<JoinMeet> createState() => _JoinMeetState();
}

class _JoinMeetState extends State<JoinMeet> {
  final AuthMethods _auth = AuthMethods();
  // final JitsiMeeting _jitsiMeet = JitsiMeeting();
  late TextEditingController meetId;
  late TextEditingController name;
  bool isAudioMute = true;
  bool isVideoMute = true;
  @override
  void initState() {
    super.initState();
    meetId = TextEditingController();
    name = TextEditingController(text: _auth.user.displayName);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    meetId.dispose();
    // JitsiMeet.removeAllListeners();
  }

  // JoinMeeting() {
  //   _jitsiMeet.createNewMeeting(
  //       roomName: meetId.text,
  //       isAudioMuted: isAudioMute,
  //       isVideoMuted: isVideoMute,
  //       username: name.text);
  // }

  Audio(bool val) {
    setState(() {
      isAudioMute = val;
    });
  }

  Video(bool val) {
    setState(() {
      isVideoMute = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(height: 150,width: 150,child: CircleAvatar(backgroundImage: NetworkImage(_auth.user.photoURL.toString(),),)),
         SizedBox(height: 50,),
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetId,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: name,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            // onTap: JoinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join ',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetOption(
            text: "Mute Audio",
            isMute: isAudioMute,
            onChange: Audio,
          ),
          MeetOption(
            text: "Turn off My video",
            isMute: isVideoMute,
            onChange: Video,
          ),
        ],
      ),
    );
  }
}
