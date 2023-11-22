import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'there are no weather 😫 start ',
              style: TextStyle(fontSize: 25, fontFamily: 'Ubuntu'),
            ),
            SizedBox(height: 10),
            Text(
              'searching now 👀 🔍',
              style: TextStyle(fontSize: 28, fontFamily: 'Ubuntu'),
            ),
          ],
        ),
      ),
    );
  }
}
