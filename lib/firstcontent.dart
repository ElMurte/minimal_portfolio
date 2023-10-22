import 'package:flutter/material.dart';
import 'package:minimal_portfolio/socialmedialinks.dart';

class FirstContent extends StatelessWidget {
  const FirstContent({super.key, required this.thelinks});
  final SocialMediaLinks thelinks;
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
      padding: EdgeInsets.only(bottom: padding, left: padding, right: padding),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SelectableText(
                'Hello people!  I am',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 16),
              const SelectableText(
                'Elvis Murtezan',
                style: TextStyle(fontSize: 66, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SelectableText(
                'I build software with different technologies.',
                style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SelectableText(
                'I’m a passionate software engineer based in the Netherlands, with a solid foundation in both front-end and back-end development. I am currently contributing to the air transport industry.',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 16),
              Row(
                children: [thelinks],
              )
            ],
          ),
        ],
      ),
    );
  }
}
