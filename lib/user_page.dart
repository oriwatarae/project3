import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final Map<String, dynamic> episode;

  UserPage(this.episode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(episode['image']),
          const SizedBox(height: 20),
          Text('Anime: ${episode['filename']}'),
          Text('Episode: ${episode['episode']}'),
          Text('Similarity: ${episode['similarity']}'),
        ],
      ),
    );
  }
}
