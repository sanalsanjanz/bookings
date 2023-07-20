import 'package:bookmyroom/search/guid/searchGuid.dart';
import 'package:bookmyroom/search/stay/searchHotels.dart';
import 'package:bookmyroom/search/taxi/searchTaxi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

int initialIndex = 0;
List<Widget> _pages = [
  const SearchHotels(),
  const SearchTaxi(),
  const SearchGuid()
];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
            // floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    // pinned: true,
                    floating: true,
                    snap: true,
                    toolbarHeight: 0,
                    elevation: 0,
                    backgroundColor: const Color(0xffBA94D1),
                    bottom: TabBar(
                      onTap: (value) {
                        setState(() {
                          initialIndex = value;
                        });
                      },
                      indicatorColor: Colors.purple,
                      tabs: const [
                        Tab(icon: FaIcon(FontAwesomeIcons.hotel), text: "STAY"),
                        Tab(
                          icon: FaIcon(FontAwesomeIcons.car),
                          text: 'TAXI',
                        ),
                        Tab(
                            icon: FaIcon(FontAwesomeIcons.userAstronaut),
                            text: "GUID")
                      ],
                    ),
                  )
                ],
            body: _pages[initialIndex]),
      ),
    );
  }
}
