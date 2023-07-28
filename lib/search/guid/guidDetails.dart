import 'package:flutter/material.dart';

class GuidDetailsPage extends StatelessWidget {
  const GuidDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('About'),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Color(0xffBA94D1),
              boxShadow: [
                BoxShadow(blurRadius: 40),
              ],
              image: DecorationImage(
                image: AssetImage('assets/guid.png'),
              ),
            ),
            height: 200,
            // color: Colors.red,
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (builder, index) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.location_city),
                      title: Text('Places ${index + 1}'),
                    ),
                  ),
                ),
                Align(
                  //bottom: 10,
                  //right: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Book Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
