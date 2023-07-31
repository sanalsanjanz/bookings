import 'package:bookmyroom/search/taxi/choosePage.dart';
import 'package:flutter/material.dart';

class SearchTaxi extends StatefulWidget {
  const SearchTaxi({super.key});

  @override
  State<SearchTaxi> createState() => _SearchTaxiState();
}

// ignore: camel_case_types
class _SearchTaxiState extends State<SearchTaxi> {
  TextEditingController picController = TextEditingController();
  TextEditingController whrController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/taxi.png'),
            ),
          ),
          const Text(
            'Enter your location',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: picController,
            decoration: const InputDecoration(
              // border: OutlineInputBorder(),
              labelText: 'pickup',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: whrController,
            decoration: const InputDecoration(
              // border: OutlineInputBorder(),
              labelText: 'To where',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const choosePage(),
                ));
              },
              child: const Text('Search'),
            ),
          ),
        ]),
      ),
    );
  }
}
