// ignore_for_file: must_be_immutable

import 'package:bookmyroom/authentication.dart';
import 'package:bookmyroom/widgets/points.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Book Now'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
          Card(
            child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Rooms and guests'),
                    Text('$rooms rooms, $adults adults, $children children')
                  ],
                ),
              ),
              children: [
                Row(
                  children: [
                    const Expanded(child: Center(child: Text('Rooms'))),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            rooms > 1
                                ? setState(() {
                                    rooms = rooms - 1;
                                  })
                                : '';
                          },
                          icon: const FaIcon(FontAwesomeIcons.minus)),
                    ),
                    Expanded(
                        child: SizedBox(
                      child: Center(
                        child: Text(rooms.toInt().toString()),
                      ),
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              rooms = rooms + 1;
                            });
                          },
                          icon: const FaIcon(FontAwesomeIcons.plus)),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Expanded(child: Center(child: Text('Adults'))),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            adults > 1
                                ? setState(() {
                                    adults = adults - 1;
                                  })
                                : '';
                          },
                          icon: const FaIcon(FontAwesomeIcons.minus)),
                    ),
                    Expanded(
                        child: SizedBox(
                      child: Center(
                        child: Text(adults.toInt().toString()),
                      ),
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              adults = adults + 1;
                            });
                          },
                          icon: const FaIcon(FontAwesomeIcons.plus)),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Expanded(child: Center(child: Text('Children'))),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            children > 1
                                ? setState(() {
                                    children = children - 1;
                                  })
                                : '';
                          },
                          icon: const FaIcon(FontAwesomeIcons.minus)),
                    ),
                    Expanded(
                        child: SizedBox(
                      child: Center(
                        child: Text(children.toInt().toString()),
                      ),
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              children = children + 1;
                            });
                          },
                          icon: const FaIcon(FontAwesomeIcons.plus)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  Text(
                    'Facilities',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  UnorderedList(
                      ["Room service", "CCTV in common area", 'TV', 'Internet'])
                ],
              ),
            ),
          ),
          const Divider(),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text(
            'Kai Heng Century Hotel offers ultimate comfort and luxury. This 4-storied hotel is a beautiful combination of traditional grandeur and modern facilities. The 255 exclusive guest rooms are furnished with a range of modern amenities such as television and internet access. International direct-dial phone and safe are also available in any of these rooms. Wake-up call facility is also available in these rooms.',
            textAlign: TextAlign.justify,
          ),
          const Divider(),
          const Text(
            'Policies',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text(
            'check in from 12pm',
            textAlign: TextAlign.justify,
          ),
          const Text(
            'check out 12 am',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                /*Note : create a global variable for checking is the user
                 signed already,if they signed , 
                 the page should navigate to the payment page ,
                  otherwise to login page*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => Authentication(),
                  ),
                );
              },
              child: const Text('Book Now'),
            ),
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
