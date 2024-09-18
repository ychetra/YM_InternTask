import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vertical Listview"),
      ),
      body: hview(),
    );
  }
}

Widget hview() {
  return Column(
    children: [
      // List 1 with Icons
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  color: Colors.blue[100],
                  child: const Icon(Icons.ac_unit,
                      size: 50, color: Colors.blue), // Example Icon
                );
              },
            ),
          ),
        ],
      ),

      // List 2 with ListTiles
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Person',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 300, // Adjust width for ListTile
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.person,
                        color: Colors.red), // Example Icon
                    title: Text('Person $index'),
                    subtitle: Text('Subtitle $index'),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // List 3 with ListTiles
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Star',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.star,
                        color: Colors.green), // Example Icon
                    title: Text('Star $index'),
                    subtitle: Text('Subtitle $index'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}
