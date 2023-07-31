import 'package:bookmyroom/search/stay/hotelDetails.dart';
import 'package:bookmyroom/widgets/hotelCard.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          title: const Column(
            children: [
              Text('Explore'),
            ],
          ),
        ),
        body: ListView(
          children: [
            const Divider(
              color: Colors.transparent,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Top Rated Hotel to Stay',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 150,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  HotelCard(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HotelDetails()));
                    },
                    name: 'Barza',
                    image: 'assets/1.jpg',
                  ),
                  const VerticalDivider(),
                  HotelCard(
                    name: 'Tiyago',
                    image: 'assets/2.jpg',
                  ),
                  const VerticalDivider(),
                  HotelCard(
                    name: 'Sufies',
                    image: 'assets/3.jpg',
                  ),
                  const VerticalDivider(),
                  HotelCard(
                    name: 'Maganthra',
                    image: 'assets/0.jpg',
                  ),
                  const VerticalDivider(),
                  HotelCard(
                    name: 'Taj',
                    image: 'assets/5.jpg',
                  ),
                  const VerticalDivider(),
                ],
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Choose a taxi from here',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
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
                      radius: (80.0),
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/imgs/002.jpeg',
                            fit: BoxFit.cover,
                          )),
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
                  onTap: () => print("tap"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/imgs/008.jpeg',
                            height: 150, fit: BoxFit.cover),
                      ),
                      const ListTile(
                        title: Text('price'),
                        subtitle: Text('ratings'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                      radius: (80.0),
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/imgs/003.jpeg',
                            fit: BoxFit.cover,
                          )),
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
                  onTap: () => print("tap"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/imgs/009.jpeg',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const ListTile(
                        title: Text('price'),
                        subtitle: Text('ratings'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
