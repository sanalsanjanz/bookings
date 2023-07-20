// ignore_for_file: must_be_immutable

import 'package:bookmyroom/search/stay/hotelLists.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchHotels extends StatefulWidget {
  const SearchHotels({super.key});

  @override
  State<SearchHotels> createState() => _SearchHotelsState();
}

class _SearchHotelsState extends State<SearchHotels> {
  String selectedDate = 'choose date';
  String agra =
      'https://assets-news.housing.com/news/wp-content/uploads/2022/07/14005316/Places-to-visit-in-Agra-FEATURE-compressed.jpg';
  String kolkata =
      'https://www.andbeyond.com/wp-content/uploads/sites/5/india-kolkata-boat-river-hooghly-howra-bridge.jpg';
  String bnglr =
      'https://img.traveltriangle.com/blog/wp-content/uploads/2020/01/places-to-visit-in-Bangalore-in-June1.jpg';
  String kochi =
      'https://s3.india.com/travel/wp-content/uploads/2015/05/Main10.jpg';
  String waynad =
      'https://cdn-bcmad.nitrocdn.com/gVUnYPlQZlrdWKSAEfOttefJujPbOsQk/assets/images/optimized/rev-5f897cb/wp-content/uploads/2016/08/lanternstay-wooden-cottage-6-2.jpg';
  String manali =
      'https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20190722114311/Manalis-houses-located-on-hills-in-state-of-himachal-pradesh.jpg';
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
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(hintText: 'Location'),
                        ),
                        Card(
                          child: ListTile(
                            title: Center(
                              child: InkWell(
                                onTap: () async {
                                  var date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1));
                                  if (date != null) {
                                    final result =
                                        DateFormat('yMMMMEEEEd').format(date);
                                    setState(() {
                                      selectedDate = result;
                                    });
                                  }
                                },
                                child: Container(
                                  child: Text(selectedDate),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration:
                                    InputDecoration(hintText: 'No Rooms'),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration:
                                    InputDecoration(hintText: 'No Persons'),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
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
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CityCard(
                            image: bnglr,
                            city: 'BANGLORE',
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: CityCard(
                            image: kochi,
                            city: 'KOCHI',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CityCard(
                            image: waynad,
                            city: 'WAYNAD',
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: CityCard(
                            image: kolkata,
                            city: 'KOLKATA',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CityCard(
                            image: agra,
                            city: 'AGRA',
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: CityCard(
                            image: manali,
                            city: 'MANALI',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class CityCard extends StatelessWidget {
  CityCard({
    super.key,
    required this.city,
    required this.image,
  });
  String image;
  String city;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => HotelList(
                  city: city,
                  image: image,
                )));
      },
      child: Card(
        color: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: SizedBox(
          height: 160,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                height: 160,
                color: Colors.black45,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  city,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
              /*  Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.abc), Text('Trissur')],
                  ),
                ],) */
            ],
          ),
        ),
      ),
    );
  }
}
