import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Column(
        children: [
          Expanded(child: SizedBox()),
          /*  Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/stay.png'),
          ), */
          Expanded(
            child: Image(
              image: AssetImage('assets/stay.png'),
            ),
          ),
          /*  Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Image(
              image: AssetImage('assets/guid.png'),
            ),
          ), */
        ],
      ),
    );
  }
}
