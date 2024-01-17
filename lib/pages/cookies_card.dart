import 'package:cookies/colors.dart';
import 'package:cookies/models/cookies.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CookkiesCard extends StatelessWidget {
  const CookkiesCard({super.key, required this.cookie});
  final Cookie cookie;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cookieSize = size.height * 0.16;
    var cardSize = size.height * 0.20;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: cardSize,
          width: cardSize,
          decoration: const BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(75),
              )),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 16, right: 32, bottom: 16),
            child: Column(
              children: [
                Text(
                  cookie.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.crown, color: orange, size: 16),
                    Text(
                      "  Premium",
                      style: TextStyle(color: Colors.orange, fontSize: 18),
                    ),
                  ],
                ),
                Text(
                  cookie.price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: -(cookieSize - 32),
            left: -(cardSize - cookieSize) / 2,
            child: SizedBox(
              height: cookieSize,
              width: cookieSize,
              child: Image.asset(cookie.image),
            )),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
