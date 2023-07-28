import 'package:bookmyroom/payments/payment.dart';
import 'package:bookmyroom/signup.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatelessWidget {
  Authentication({super.key});
  final FirebaseAuth authentication = FirebaseAuth.instance;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Login'),
        ),
        body: Column(
          children: [
            ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 150,
                color: const Color(0xffBA94D1),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(hintText: 'email'),
                    ),
                    const Divider(color: Colors.transparent),
                    const TextField(
                      decoration: InputDecoration(hintText: 'password'),
                    ),
                    const Divider(color: Colors.transparent),
                    Row(
                      children: [
                        const Text("don't have an account ?"),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ct) => SignUp(),
                              ),
                            );
                          },
                          child: const Text('create account'),
                        )
                      ],
                    ),
                    const Divider(color: Colors.transparent),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {
                        await googleSignin(context);
                      },
                      child: const Text('SignIn'),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                await signup(context);
              },
              child: const Text('SignIn with Google'),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // ProgressDialog.show(context: context);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result =
          await authentication.signInWithCredential(authCredential);
      User? user = result.user;
      if (user != null) {
        await saveUserDetails(
                name: user.displayName.toString(),
                photoUrl: user.photoURL.toString(),
                email: user.email.toString())
            .then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MakePayment(),
            ),
          ),
        );
      }
    }
  }

  Future saveUserDetails(
      {required String name,
      required String photoUrl,
      required String email}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('photo', photoUrl);
    sharedPreferences.setString('mail', email);
  }

  googleSignin(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usernameController.text, password: passwordController.text)
          .then(
            (value) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctn) => const MakePayment(),
              ),
            ),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
