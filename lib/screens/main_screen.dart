import 'package:flutter/material.dart';
import 'package:json_placeholder_flutter/screens/posts_screen.dart';
import 'package:json_placeholder_flutter/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UsersScreen(),
                      ));
                },
                child: const Text("USERS")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostsScreen(),
                      ));
                },
                child: const Text("POSTS")),
          ]),
    );
  }
}
