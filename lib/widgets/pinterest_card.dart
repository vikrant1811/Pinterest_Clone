import 'package:flutter/material.dart';

class PinterestCard extends StatelessWidget {
  final String imageUrl;

  const PinterestCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              width: 150,
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),

        ],
      ),
    );
  }
}
