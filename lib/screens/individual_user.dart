import 'package:flutter/material.dart';
import 'package:json_placeholder_flutter/screens/users_screen.dart';

class IndividualUser extends StatefulWidget {
  final User user;

  const IndividualUser({Key? key, required this.user}) : super(key: key);

  @override
  State<IndividualUser> createState() => _IndividualUserState();
}

class _IndividualUserState extends State<IndividualUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 16),
          Text(widget.user.name, style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
          Text(widget.user.email, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
          Text(widget.user.phone, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
          const SizedBox(height: 16),
          Text("Company", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.black), textAlign: TextAlign.center,),
          Text(widget.user.company.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 42), textAlign: TextAlign.center,),
          Text(widget.user.company.bs, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center,),
          Text("\"${widget.user.company.catchphrase}\"", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
        ],),
      ),
    );
  }
}
