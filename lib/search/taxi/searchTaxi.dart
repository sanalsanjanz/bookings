import 'package:flutter/material.dart';

class SearchTaxi extends StatelessWidget {
  const SearchTaxi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => const ListTile(
                title: Text('Taxi'),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 50),
    );
  }
}
