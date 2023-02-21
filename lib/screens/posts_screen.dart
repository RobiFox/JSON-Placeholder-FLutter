import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_placeholder_flutter/super/json_state.dart';
import 'individual_post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  JsonState<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends JsonState<PostsScreen> {
  @override
  String get url => "https://jsonplaceholder.typicode.com/posts";

  List<Post> posts = [];

  @override
  void onResponseGet(String responseBody) {
    setState(() {
      posts.clear();
      for (var user in List.from(jsonDecode(responseBody))) {
        posts.add(Post.fromJson(user));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getResponse,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post p = posts[index];
                return ListTile(
                  title: Text(
                    p.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Text(p.id.toString()),
                  subtitle: Text(p.body),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return IndividualPost(post: p);
                      },
                    ));
                  },
                );
              });
        },
      ),
    );
  }
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        title = json["title"],
        body = json["body"];
}
