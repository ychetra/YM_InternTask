import 'package:flutter/material.dart';
import 'package:gridview_6_pages/view/Task_Page/task_pages.dart';
import 'package:get/get.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final List<Map<String, dynamic>> pages = [
  {'icon': Icons.task, 'text': 'page -1-'},
  {'icon': Icons.task, 'text': 'page -2-'},
  {'icon': Icons.task, 'text': 'page -3-'},
  {'icon': Icons.task, 'text': 'page -4-'},
  {'icon': Icons.task, 'text': 'page -5-'},
  {'icon': Icons.task, 'text': 'page -6-'},
  {'icon': Icons.pending, 'text': 'Pending Task'}
];

Widget grid() {
  return GridView.builder(
    itemCount: pages.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
    ),
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => _navigateToPage(index),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 5,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  pages[index]['icon'],
                  size: 50,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  pages[index]['text'],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _navigateToPage(int index) {
  switch (index) {
    case 0:
      Get.to(() => const Page1());
      break;
    case 1:
      Get.to(() => const Page2());
      break;
    case 2:
      Get.to(() => const Page3());
      break;
    case 3:
      Get.to(() => const Page4());
      break;
    case 4:
      Get.to(() => const Page5());
      break;
    case 5:
      Get.to(() => const Page6());
      break;
    default:
      Get.to(() => const Page1());
      break;
  }
}
