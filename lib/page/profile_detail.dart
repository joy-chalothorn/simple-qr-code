import 'package:flutter/material.dart';
import '../style/text_style.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person_pin, color: Colors.black),
              const SizedBox(width: 30),
              Text(
                'ชโลธร ไชยมนตรี',
                style: customTextStyle2(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.person_pin_rounded, color: Colors.black),
              const SizedBox(width: 30),
              Text(
                'จอย',
                style: customTextStyle2(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.phone, color: Colors.black),
              const SizedBox(width: 30),
              Text(
                '0994576699',
                style: customTextStyle2(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.people, color: Colors.black),
              const SizedBox(width: 30),
              Text(
                '00000001',
                style: customTextStyle2(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.mail, color: Colors.black),
              const SizedBox(width: 30),
              Text(
                'joy.chalothorn@gmail.com',
                style: customTextStyle2(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black),
              const SizedBox(width: 30),
              Text(
                'กรุงเทพ',
                style: customTextStyle2(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
