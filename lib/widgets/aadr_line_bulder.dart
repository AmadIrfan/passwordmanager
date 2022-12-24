import 'package:flutter/material.dart';

class LineBuilder extends StatelessWidget {
  const LineBuilder({super.key, required this.e});
  final e;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.name!,
                ),
                Text(
                  e.street_Address!,
                ),
                Row(
                  children: [
                    Text(
                      e.city!,
                    ),
                    Text(' , '),
                    Text(
                      e.postalCode!,
                    ),
                    Text(' , '),
                    Text(e.country!),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      e.phone!,
                    ),
                    Text(' , '),
                    Text(e.email!),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
