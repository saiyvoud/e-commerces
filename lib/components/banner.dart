import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerces/components/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BannerComponents extends StatefulWidget {
  const BannerComponents({super.key});

  @override
  State<BannerComponents> createState() => _BannerComponentsState();
}

class _BannerComponentsState extends State<BannerComponents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _banner(),
        _indotor(),
      ],
    );
  }

  int currentIndex = 0;

  Widget _banner() {
    return Container(
      height: 140,
      width: double.infinity,
      child: CarouselSlider(
        items: banner
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(e, fit: BoxFit.cover),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reson) {
              setState(() {
                currentIndex = index;
              });
            }),
      ),
    );
  }

  Widget _indotor() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: banner.map((e) {
        var index = banner.indexOf(e);
        return Container(
          height: currentIndex == index ? 10 : 5,
          width: 8,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.indigo.shade800,
            shape: BoxShape.circle,
          ),
        );
      }).toList(),
    );
  }
}
