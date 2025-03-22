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
    return SelectionArea(
      child: Container(
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
                  'I build value with different technologies.',
                  style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'I’m a passionate software & data engineer based in the Netherlands, with solid foundations in both front-end and back-end development. I am currently contributing within the air transport industry as a developer for the passenger portfolio.',
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
      ),
    );
  }
}
