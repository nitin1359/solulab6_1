import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customBoxButton({
  required VoidCallback onTap,
  boxColor = Colors.white,
  IconData icon = CustomFIcon.icon_5,
  iconColor = const Color(0xFF030319),
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: boxColor,
        border: Border.all(
          color: const Color(0xffC4C4C4),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    ),
  );
}

Widget customText({
  required String text,
  double? fontSize = 14.0,
  fontWeight = FontWeight.w400,
  color = const Color(0xFF030319),
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.dmSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Widget customTopMenu({
  required String text,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 60,
      child: Column(
        children: [
          Icon(
            icon,
            size: 32.0,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget todayContainer() {
  return Container(
    height: 96,
    decoration: BoxDecoration(
      color: const Color(0xff4CD080).withOpacity(0.1),
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 24),
          child: SvgPicture.asset('assets/images/svg/cashback50.svg'),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
                child: customText(
                  text: 'Cashback 50%',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff030319),
                ),
              ),
              const SizedBox(height: 4),
              customText(
                text: 'Get 50% cashback for the next top up',
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: const Color(0xff8F92A1),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  customText(
                    text: 'Top up now',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff4CD080),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Color(0xff4CD080),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget categoryIndicator({
  required String text,
  required Color color,
}) {
  return Row(
    children: [
      Container(
        height: 6,
        width: 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
      ),
      const SizedBox(width: 8),
      customText(
        text: text,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    ],
  );
}

Widget wideButton({
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color(0xff4CD080),
      ),
      child: Center(
        child: customText(
            text: text,
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}
