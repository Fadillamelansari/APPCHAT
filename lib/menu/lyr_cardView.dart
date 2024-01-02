import 'package:flutter/material.dart';

class LyrCardView extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
      title: '',
      description: '',
      imagePath: 'assets/sma.jpg',
    ),
    CardItem(
      title: '',
      description: 'This is the description for Card 2.',
      imagePath: 'assets/sma1.jpg',
    ),
    CardItem(
      title: '',
      description: 'Halaman dari luar.',
      imagePath: 'assets/sma2.jpg',
    ),
    CardItem(
      title: '',
      description: 'Guru-guruku.',
      imagePath: 'assets/guru.jpg',
    ),
    CardItem(
      title: '',
      description: 'memory pas lulus',
      imagePath: 'assets/da.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMA Dian Andalas Padang'),
      ),
      body: ListView.builder(
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          return cardItems[index];
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  CardItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
