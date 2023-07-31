import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffBA94D1),
          title: const Text(
            'Payment',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const PaymentOptions(),
      ),
    );
  }
}

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PaymentButton(icon: Icons.payment, label: 'Google Pay'),
          SizedBox(height: 16.0),
          PaymentButton(icon: Icons.payment, label: 'Paytm'),
          SizedBox(height: 16.0),
          PaymentButton(icon: Icons.payment, label: 'PhonePe'),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const PaymentButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white.withOpacity(0.3),
        padding: const EdgeInsets.all(16.0),
      ),
      onPressed: () {
        // Add functionality for the button here
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 16.0),
          Text(label, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
