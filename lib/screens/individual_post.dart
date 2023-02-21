import 'package:flutter/material.dart';
import 'package:json_placeholder_flutter/screens/posts_screen.dart';
import 'package:json_placeholder_flutter/screens/users_screen.dart';

import 'individual_user.dart';

class IndividualPost extends StatefulWidget {
  final Post post;

  const IndividualPost({Key? key, required this.post}) : super(key: key);

  @override
  State<IndividualPost> createState() => _IndividualPostState();
}

class _IndividualPostState extends State<IndividualPost> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width > 640.0 ? 128.0 : 16.0),
                    child: Text(widget.post.title, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center,),
                  ),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  Text(widget.post.body, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                  ],),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
