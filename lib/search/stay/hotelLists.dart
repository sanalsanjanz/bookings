// ignore_for_file: must_be_immutable

import 'package:bookmyroom/constants/constants.dart';
import 'package:bookmyroom/search/stay/hotelDetails.dart';
import 'package:bookmyroom/widgets/hotelCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class HotelList extends StatefulWidget {
  HotelList({super.key, required this.city, required this.image});
  String city;
  String image;

  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  double rating = 0.0;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.purple[50],
      /*  appBar: AppBar(
        toolbarHeight: 0,
        /*     systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent), */
      ), */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: MediaQuery.of(context).size.width,
                  autoPlay: false,
                  // aspectRatio: 2,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: items,
              ),
              Positioned(
                bottom: 5, right: 5,
                // alignment: Alignment.topCenter,
                child: Center(
                  child: DotsIndicator(
                    dotsCount: items.length,
                    position: currentIndex,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Top Rated Hotels'),
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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                child: Card(
                  child: SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        const Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/1.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            bottom: 5,
                            left: 10,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Hotel Name',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.locationDot,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Location',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SmoothStarRating(
                                        allowHalfRating: false,
                                        onRatingChanged: (v) {
                                          rating = v;
                                          setState(() {});
                                        },
                                        starCount: 5,
                                        rating: rating,
                                        size: 15.0,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.blur_on,
                                        color: Colors.green,
                                        //  borderColor: Colors.green,
                                        spacing: 0.0)
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
