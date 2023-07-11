import 'dart:convert';

import 'package:firebase_notification/notification_Services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInIt(context);
    notificationServices.setupbabkground(context);
    notificationServices.isTokenRefresh();
    notificationServices.forgroundmessage();
    notificationServices.getdeviceToken().then((value) {
      print('Device Token :');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Notification'),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              notificationServices.getdeviceToken().then((value) async {
                var data = {
                  // 'to': value.toString(),
                  'to':
                      'cujMiRKNRCSey8LhkVYcKh:APA91bHSUQEqzGw9tQ5ZqT8pQrJDSVJtVA2Ei80Le4DvT83gFwFz6G0tqiya7gN4qe3mJ07HNzm4p9xyWzxBkO1dKnPyu5oXMNWosKsheMb13wN0H4CYybgmr5GR5ir9HuC_GQZ7Nu0K',
                  'priority': 'high',
                  'notification': {
                    'title': 'shaban satti',
                    'body': 'test',
                  },
                  'data': {'type': 'msg', 'id': '123456'}
                };

                await http.post(
                    Uri.parse('https://fcm.googleapis.com/fcm/send'),
                    body: jsonEncode(data),
                    headers: {
                      'Content-Type': 'application/json;charset=UTF-8',
                      //'Content-Type': 'application/json;charset=UTF-8',
                      //'Charset': 'utf-8',
                      'Authorization':
                          'key=AAAA1nbYSk8:APA91bEl6w1SraEAjVPFRP0VR38GluY-S3SXQj83IO0-g-DgX75p9yP0BHlidoFnGUsKpQFTs9g6N0140MEluvx2rxHux1K_GyP39x02YVwPkcX8Mzkvx-s8c6JxTX7hhsz6IieJxXq3'
                    });
              });
            },
            child: Text('Send Notification'),
          ),
        ));
  }
}
