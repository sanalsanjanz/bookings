import 'package:bookmyroom/search/guid/guidDetails.dart';
import 'package:flutter/material.dart';

class SearchGuid extends StatelessWidget {
  const SearchGuid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(hintText: 'Location'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {},
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => const GuidDetailsPage(),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple[100],
                              child: const Icon(Icons.person),
                            ),

                            title: Text('guid name ${index + 1}'),
                            //replace with guid name
                            subtitle: const Text('tap to know more'),
                          ),
                        ),
                    itemCount: 50),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
