import 'package:bookmyroom/payments/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  Widget space = const SizedBox(height: 20);
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                InkWell(
                  child: Hero(
                    tag: 'img',
                    child: Image(
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/guid.png'),
                    ),
                  ),
                ),
                space,
                TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a value';
                    } else if (value.length < 3) {
                      return 'user name must have atleast 4 letters';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      )),
                ),
                space,
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                space,
                SizedBox(
                  width: 100,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: const StadiumBorder()),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await createAccount(context);
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createAccount(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: usernameController.text,
            password: passwordController.text,
          )
          .then((value) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctn) => const MakePayment())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future saveLogin(BuildContext context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('login', true);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctc) => const MakePayment(),
      ),
    );
  }
}
/* 

  */