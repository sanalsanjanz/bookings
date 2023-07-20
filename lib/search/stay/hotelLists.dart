// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotelList extends StatefulWidget {
  HotelList({super.key, required this.city, required this.image});
  String city;
  String image;
  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  final items = [
    HotelSlideItems(
        imageLink:
            'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg',
        hotelName: 'HiTon'),
    HotelSlideItems(
        imageLink:
            'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg',
        hotelName: 'ABV Hotel'),
    HotelSlideItems(
        imageLink:
            'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg',
        hotelName: 'Mariya'),
    HotelSlideItems(
        imageLink:
            'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg',
        hotelName: 'TOP Stay'),
    HotelSlideItems(
        imageLink:
            'https://s3.india.com/travel/wp-content/uploads/2015/05/Main10.jpg',
        hotelName: 'ROOFTO')
  ];

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
          const Divider(),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Card(
                        child: ListTile(),
                      )))
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  HotelCard({super.key, required this.image, required this.name});
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      height: 180,
      width: 180,
      child: Stack(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            height: 180,
            width: 180,
            opacity: const AlwaysStoppedAnimation(50),
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelSlideItems extends StatelessWidget {
  HotelSlideItems(
      {super.key, required this.imageLink, required this.hotelName});
  String imageLink;
  String hotelName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageLink,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Colors.purple,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
              child: Center(
                child: Text(
                  hotelName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
