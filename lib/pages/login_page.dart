import 'package:flutter/material.dart';
import 'package:mald_registration_app02/pages/home_page.dart';
import 'package:mald_registration_app02/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/MALD_LOGO_1.png',
                height: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "WELCOME TO MALD SCHOOL",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () async {
                  setState(() {
                    _isProcessing = true;
                  });
                  await singInWithGoogle().then((result) {
                    print(result);
                    if (result != null) {
                      //Navigator.of(context).pop();
                      // for navigate to Home page after login in
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  }).catchError((error) {
                    print("Registration Error: $error");
                  });
                  setState(() {
                    _isProcessing = false;
                  });
                },
                child: _isProcessing
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.red,
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:
                                  AssetImage("assets/images/google_logo.png"),
                              height: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
