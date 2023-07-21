// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
