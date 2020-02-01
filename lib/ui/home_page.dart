import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:insta_whatsapp/util/util_methods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController phoneController;
  TextEditingController messageController;
  final String whatsappUrl = 'https://api.whatsapp.com/send?phone=';

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: (){
              showAboutDialog(
                  context: context,
                  applicationName: 'InstaWhatsapp',
                  applicationVersion: '1.0.0',
                  applicationIcon: Image.asset('assets/appicon.png'),
                  applicationLegalese:
                  'App by @kriticalflare  \n\nUses icons from icons8.com',
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                            child: GestureDetector(
                                onTap: () {
                                  UtilMethods.launchURL('https://github.com/kriticalflare');
                                },
                                child: Image.asset(
                                  'assets/github.png',
                                  height: 70,
                                  width: 70,
                                )),
                          ),
                        ),
                      ],
                    )
                  ]
              );
            },
            child: Text(
              'InstaWhatsapp',
              style: TextStyle(color: Colors.greenAccent),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '+91 1234567890',
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Message',
                        labelText: 'Message',
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: () async {
                    String phone = phoneController.text;
                    String message = messageController.text.replaceAll(" ", "");
                    String encodedMessage = Uri.encodeQueryComponent(message);
                    AndroidIntent intent = AndroidIntent(
                      action: 'action_view',
                      data: '$whatsappUrl$phone&text=$encodedMessage',
                    );
                    await intent.launch();
                  },
                  child: Text('Send Message'),
                )
              ],
            ),
          ),
        ));
  }
}
