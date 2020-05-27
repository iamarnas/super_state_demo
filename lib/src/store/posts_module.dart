import 'dart:convert';

import 'package:flutter_super_state/flutter_super_state.dart';
import 'package:http/http.dart' as http;
import 'package:super_state_demo/src/models/user_post.dart';

class PostModule extends StoreModule {
  List<UserPost> posts = [];

  PostModule(Store store) : super(store) {
    // Fetch list on first run
    fetchPosts();
  }

  void refreshPosts() async {
    setState(() => posts.clear());
    // Fake loading time
    await Future.delayed(Duration(seconds: 2));
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      setState(() {
        posts = (json.decode(response.body) as List)
            .map((post) => UserPost.fromJson(post))
            .toList();
      });
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
