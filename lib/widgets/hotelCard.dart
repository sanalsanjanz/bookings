// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  HotelCard({super.key, required this.image, required this.name, this.onTap});
  String image;
  String name;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
