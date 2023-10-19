import 'package:flutter/material.dart';

class FirstContent extends StatelessWidget {
  const FirstContent({super.key});
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.10
        : 16.0;
    double marginsize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.12
        : 16.0;
    return Container(
      margin: EdgeInsets.all(marginsize),
      padding: EdgeInsets.only(left: padding, right: padding),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello people!  I am',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Elvis Murtezan',
                style: TextStyle(fontSize: 66, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'I build software with different technologies.',
                style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'I’m a confident software engineer, I consider myself a full stack developer \nand enjoy it a lot, currently working in the air transport industry.',
                style: TextStyle(fontSize: 19),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
