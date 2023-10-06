import 'package:flutter/material.dart';

class FirstContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.12,
        bottom: MediaQuery.of(context).size.width * 0.12,
        left: MediaQuery.of(context).size.width * 0.0,
        right: MediaQuery.of(context).size.width * 0.0,
      ),
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
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Elvis Murtezan.',
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
