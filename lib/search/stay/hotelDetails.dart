// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails({super.key});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

String checkInDate = 'Check-In';
String checkOutDate = 'Check-Out';
int rooms = 1;
int adults = 2;
int children = 0;

class _HotelDetailsState extends State<HotelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Book Now'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              'Hotel Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            trailing: SmoothStarRating(
                allowHalfRating: false,
                starCount: 5,
                rating: 3, //have to change dynamically
                size: 15.0,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.blur_on,
                color: Colors.green,
                //  borderColor: Colors.green,
                spacing: 0.0),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: MediaQuery.of(context).size.width,
                  autoPlay: true,
                  // aspectRatio: 2,
                  enlargeCenterPage: true,
                ),
                items: [
                  HotelDetailsSlides(
                    image: 'assets/1.jpg',
                  ),
                  HotelDetailsSlides(
                    image: 'assets/0.jpg',
                  ),
                  HotelDetailsSlides(
                    image: 'assets/2.jpg',
                  ),
                  HotelDetailsSlides(
                    image: 'assets/3.jpg',
                  ),
                  HotelDetailsSlides(
                    image: 'assets/4.jpg',
                  ),
                  HotelDetailsSlides(
                    image: 'assets/5.jpg',
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              //  height: 150,
              child: const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price for 1 night, 2 adults',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'RS : 1500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1));
                        if (date != null) {
                          final result1 = DateFormat('yMMMMEEEEd').format(date);
                          setState(() {
                            checkInDate = result1;
                          });
                        }
                      },
                      child: Container(
                        child: Center(child: Text(checkInDate)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1));
                        if (date != null) {
                          final result2 = DateFormat('yMMMMEEEEd').format(date);
                          setState(() {
                            checkOutDate = result2;
                          });
                        }
                      },
                      child: Container(
                        child: Center(child: Text(checkOutDate)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Rooms and guests'),
                    Text('$rooms rooms, $adults adults, $children children')
                  ],
                ),
              ),
            ),
            children: const [
              Row(
                children: [
                  Text('Rooms'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class HotelDetailsSlides extends StatelessWidget {
  HotelDetailsSlides({super.key, required this.image});
  String image;
  // String hotelName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              /*    imageUrl: imageLink,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Colors.purple,
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), */
            ),
          ),
          /* Image(
    width: double.maxFinite,
    fit: BoxFit.cover,
    image: NetworkImage(imageLink)), */
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              /* child: Center(
      child: Text(
        hotelName,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    ), */
            ),
          ),
        ],
      ),
    );
  }
}
