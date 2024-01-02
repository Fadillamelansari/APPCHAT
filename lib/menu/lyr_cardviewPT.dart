import 'package:flutter/material.dart';

class LyrCardViewPT extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
      title: 'Unicersitas Putra Indonesia YPTK Padang',
      description: 'This is the description for Card 1.',
      imagePath: 'assets/up.jpg',
    ),
    CardItem(
      title: 'Card 2',
      description: 'This is the description for Card 2.',
      imagePath: 'assets/upi2.jpg',
    ),
    CardItem(
      title: 'Card 3',
      description: 'This is the description for Card 3.',
      imagePath: 'assets/upi3.jpg',
    ),
    CardItem(
      title: 'Card 3',
      description: 'This is the description for Card 3.',
      imagePath: 'assets/upi.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perguruan Tinggi'),
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
