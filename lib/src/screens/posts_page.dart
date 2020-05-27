import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

import '../../src/models/user_post.dart';
import '../store/modules.dart' show PostModule;
import '../extensions/super_state_api.dart';
import '../extensions/string_apis.dart' show StringExtensions;

class PostsPage extends StatelessWidget {
  PostsPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // Get module by context
    final module = context.getModule<PostModule>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => module.refreshPosts(),
          ),
        ],
      ),
      body: StoreBuilder(
        builder: (context, store) {
          final posts = store.getModule<PostModule>().posts;
          return posts.isEmpty
              ? Container(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Scrollbar(
                  child: bodyList(posts),
                );
        },
      ),
    );
  }

  Widget bodyList(List<UserPost> posts) {
    final userIds = List.generate(posts.length, (i) {
      return posts[i].userId;
    }).toSet().toList();

    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: userIds.length,
      itemBuilder: (BuildContext context, int index) {
        return expansionTile(context, posts, userIds[index]);
      },
    );
  }

  Widget expansionTile(BuildContext context, List<UserPost> posts, int userId) {
    var _post = posts.firstWhere((post) => post.userId == userId);
    return ExpansionTile(
      key: PageStorageKey(userId),
      leading: CircleAvatar(child: Text(_post.userId.toString())),
      title: Text(_post.title.startWithCapitalLetter),
      subtitle: Text('Post ID: ${_post.id}'),
      children: <Widget>[
        for (var post in posts)
          if (post.userId == userId) postBody(context, post),
      ],
    );
  }

  Widget postBody(BuildContext context, UserPost post) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border(
        top: BorderSide(color: Theme.of(context).dividerColor),
        right: BorderSide(color: Theme.of(context).dividerColor),
        bottom: BorderSide(color: Theme.of(context).dividerColor),
        left: BorderSide(color: Theme.of(context).dividerColor),
      ),
    );

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Container(
            decoration: decoration,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(post.body.startWithCapitalLetter),
            ),
          ),
        ),
      ],
    );
  }
}
