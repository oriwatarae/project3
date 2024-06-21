import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAnimeEpisodes() async {
  final String apiUrl = 'https://api.trace.moe/search?cutBorders&url=https://images.plurk.com/32B15UXxymfSMwKGTObY5e.jpg';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      List<dynamic> episodes = parsed['result'];
      return episodes;
    } else {
      throw Exception('Failed to load episodes');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
