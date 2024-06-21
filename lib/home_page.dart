import 'package:flutter/material.dart';
import 'user_page.dart';
import 'user_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Episodes'),
      ),
      body: FutureBuilder(
        future: fetchAnimeEpisodes(), // Fetch data from UserService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
  List episodes = snapshot.data!;
  return ListView.builder(
    itemCount: episodes.length,
    itemBuilder: (context, index) {
      var episode = episodes[index];
      return ListTile(
        title: Text('Episode ${episode['episode']}'),
        subtitle: Text('Similarity: ${episode['similarity']}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(episode),
            ),
          );
        },
      );
    },
  );
}

          }
        ,
      ),
    );
  }
}
