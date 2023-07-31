// ignore: file_names
import 'package:bookmyroom/search/taxi/DetailsPage.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class choosePage extends StatelessWidget {
  const choosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBA94D1),
        title: const Text(
          'Choose a Ride',
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
                  height: 80,
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
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/imgs/001.jpeg',
                          ),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const DetailsPage(),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                        'assets/imgs/04.jpeg',
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
      ),
    );
  }
}
