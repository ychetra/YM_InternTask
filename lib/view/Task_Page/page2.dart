import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ListView Example'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.grey.shade700,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(child: lview2()));
  }
}

Widget lview2() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.grey,
        child: SizedBox(
          child: ListTile(
            leading: Image.asset(
              "Asset/Image/image.png",
            ),
            title: const Text('Acc'),
            subtitle: const Text(
                'a unit of connected speech or writing, especially composed of more than one sentence, that forms a cohesive whole. anything considered to be a subject for analysis by or as if by methods of literary criticism. Digital Technology. a text message.'),
          ),
        ),
      );
    },
  );
}
