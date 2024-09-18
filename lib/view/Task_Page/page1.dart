import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Group List View Example"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.grey.shade700,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: lview(),
    );
  }
}

Widget lview() {
  return Column(
    children: [
      const Text(
        'Team A',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            final user = userData.listuser[index];
            return Card(
              color: Colors.grey,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Center(
                  child: Text(
                    style: const TextStyle(decorationColor: Colors.white),
                    user.name!,
                  ),
                ),
                trailing: const Icon(Icons.arrow_right),
              ),
            );
          },
        ),
      ),
    ],
  );
}

class userData {
  String? name;
  userData({required this.name});
  static final List<userData> listuser = [
    userData(name: "Jacob"),
    userData(name: "DingDong")
  ];
}
