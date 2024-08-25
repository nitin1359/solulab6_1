// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solulab6/utils/common_widgets.dart';
import 'dart:math' as math;

Widget banner1() {
  return Container(
    width: 318,
    height: 170,
    decoration: BoxDecoration(
      color: Color(0xff00373E),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Stack(
      children: [
        Positioned(
          left: 24,
          top: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: '30% OFF',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 2),
              customText(
                text: 'Black Friday deal',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16),
              customText(
                text: 'Get discount for every topup,\ntransfer and payment',
                color: Color(0xffBDBDBD),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        Positioned(
          right: -5.33,
          top: 71.33,
          child: Transform.rotate(
            angle: 335 * math.pi / 180,
            child: Container(
              width: 106,
              height: 123,
              decoration: BoxDecoration(
                color: Color(0xff4CD080),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          top: 47,
          right: 17,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color(0xffFFD2A6),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 105,
          right: 17,
          child: customText(
            text: '30%',
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

Widget banner2() {
  return Container(
    width: 318,
    height: 170,
    decoration: BoxDecoration(
      color: Color(0xffFFD2A6),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Stack(
      children: [
        Positioned(
          left: 24,
          top: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: 'Special Offer for \nToday’s Top Up',
                color: Color(0xFF030319),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16),
              customText(
                text: 'Get discount for every topup,\ntransfer and payment',
                color: Color(0xff030319),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        Positioned(
          // right: 14.33,
          left: 206,
          top: 73,
          child: Transform.rotate(
            angle: 335 * math.pi / 180,
            child: Container(
              width: 106,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xff4CD080),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          right: -7.33,
          // left: 225,
          top: 6,
          child: Transform.rotate(
            angle: 300 / 25,
            child: Container(
              width: 106,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xff00373E),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
