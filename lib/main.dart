import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainerWidget();
  }
}

class DataItem {
  final String title;
  final String subTitle;
  final String url;

  DataItem({required this.title, required this.subTitle, required this.url});
}

class DataView {
  final DataItem item = DataItem(
      title: 'Helloo', subTitle: "subtitle", url: 'Internet not available.');
}

class MyContainerWidget extends StatelessWidget {
  MyContainerWidget({super.key});
  final DataView data = DataView();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      color: Colors.black,
      child: Column(
        children: [
          // Image.network(data.item.url),
          Text(
            data.item.url,
            style: const TextStyle(fontSize: 32, color: Colors.orange),
          ),
          Text(
            data.item.title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            data.item.title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
