import 'package:flutter/material.dart';
import 'package:mald_registration_app02/pages/login_page.dart';
import 'package:mald_registration_app02/services/auth.dart';
import 'package:mald_registration_app02/widgets/my_divider_widget.dart';

class MyMainHeader extends StatefulWidget {
  const MyMainHeader({super.key});

  @override
  State<MyMainHeader> createState() => _MyMainHeaderState();
}

class _MyMainHeaderState extends State<MyMainHeader> {
  bool _isProcessing = false;
  //    preferredSize: const Size.fromHeight(110),

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/MALD_LOGO_1.png',
                  height: 80,
                ),
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "MALD SCHOOL\n",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextSpan(text: "APPLICATION FOR\nENROLLMENT"),
                    ],
                  ),
                ),
                //SizedBox(width: 10),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      imageUrl != null ? NetworkImage(imageUrl!) : null,
                  /*Image.asset(
                              'assets/images/MALD_LOGO_1.png',
                              height: 30,
                            ),*/ //null,
                  child: imageUrl == null
                      ? const Icon(
                          Icons.account_circle,
                          size: 30,
                        )
                      : const Text("I"),
                ),
                SizedBox(width: 5),
                Text(
                  name ?? userEmail!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),

                // sign out button
                TextButton(
                  /*style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),*/
                  onPressed: _isProcessing
                      ? () {}
                      : () async {
                          setState(() {
                            _isProcessing = true;
                          });
                          await signOutGoogle().then((result) {
                            //print(result.toString());

                            // for navigate to home page
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          }).catchError((error) {
                            print("Sign out Error: $error");
                          });
                          setState(() {
                            _isProcessing = false;
                          });
                        },
                  child: Text("LOGOUT"),
                ),
              ],
            ),
          ),
        ),
        myDivider(1),
      ],
    );
  }
}
