import 'package:flutter/material.dart';
import 'PaymentApp.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBA94D1),
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.5),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E3311).withOpacity(0.0),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/imgs/001.jpeg',
                      ),
                    ),
                  ),
                ),
                const Text(
                  'name',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                        'assets/imgs/04.jpeg',
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const ListTile(
                      title: Text('price'),
                      subtitle: Text('ratings'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.language),
                      title: Text(
                          'Will Handle English, Hindi, Tamil, Malayalam,Languages'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('INDIA,KERALA'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text(
                          'Ask about shopping areas and Beaches,Trekking spots'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Driver experience: 3 years'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text('Longest trip ever recorded "500km".'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const PaymentApp(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffBA94D1),
                      ),
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
