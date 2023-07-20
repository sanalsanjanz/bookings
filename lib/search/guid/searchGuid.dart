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
                        const InkWell(
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(hintText: "_date"),
                          ),
                        ),
                        const TextField(),
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
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => const ListTile(
                          title: Text('Guid'),
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 50),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
