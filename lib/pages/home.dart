import 'package:cookies/colors.dart';
import 'package:cookies/models/cookies.dart';
import 'package:cookies/pages/Cart.dart';
import 'package:cookies/pages/avatar.dart';
import 'package:cookies/pages/cookies_bars.dart';
import 'package:cookies/pages/cookies_card.dart';
import 'package:cookies/pages/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var index = 0;
    return Scaffold(
        backgroundColor: background,
        body: body(size),
        bottomNavigationBar: Stack(clipBehavior: Clip.none, children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: navBarcolor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
            ),
          ),
          Positioned.fill(
            top: -25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    index = 0;
                  }),
                  child: NavBarButton(
                    icon: "assets/home.png",
                    text: "Home",
                    isSelected: index == 0,
                  ),
                ),
              const  SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    index = 1;
                  }),
                  child: NavBarButton(
                    icon: "assets/search.png",
                    text: "Search",
                    isSelected: index == 1,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    index = 2;
                  }),
                  child: NavBarButton(
                    icon: "assets/premium.png",
                    isSelected: index == 2,
                    text: "Premium",
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Padding body(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(children: <Widget>[
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Avatar(),
            SizedBox(
              width: 16,
            ),
            PersonalInfo(),
            Spacer(),
            Cart()
          ],
        ),
        const CookiesBar(),
        SizedBox(
          height: size.height * 0.12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: cookies.map((e) => CookkiesCard(cookie: e)).toList(),
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cookies",
              style: TextStyle(color: Colors.white, fontSize: 42),
            ),
            Text(
              "see more",
              style: TextStyle(color: orange, fontSize: 16),
            )
          ],
        ),
        Container(
            height: size.height * 0.14,
            decoration: const BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(75),
                )),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset('assets/3.png'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Double chocolate",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.crown,
                                  color: orange, size: 16),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Premium",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ]),
    );
  }
}

class NavBarButton extends StatefulWidget {
  final bool isSelected;

  const NavBarButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.isSelected});
  final String text;
  final String icon;

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: buttonColor),
          child: Image.asset(
            widget.icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          widget.text,
          style: TextStyle(color: widget.isSelected ? orange : Colors.grey),
        )
      ],
    );
  }
}
