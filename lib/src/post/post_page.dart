import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<dynamic> posts = [];

  void fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final data = json.decode(response.body);

    setState(() {
      posts = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index]['title']),
          subtitle: Text(posts[index]['body']),
        );
      },
    );
  }
}
