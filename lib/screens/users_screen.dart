import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_placeholder_flutter/screens/individual_user.dart';
import 'package:json_placeholder_flutter/super/json_state.dart';
import 'package:http/http.dart' as http;

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  JsonState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends JsonState<UsersScreen> {
  @override
  String get url => "https://jsonplaceholder.typicode.com/users";

  List<User> users = [];

  @override
  void onResponseGet(String responseBody) {
    setState(() {
      users.clear();
      for (var user in List.from(jsonDecode(responseBody))) {
        users.add(User.fromJson(user));
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
              itemCount: users.length,
              itemBuilder: (context, index) {
                User u = users[index];
                return ListTile(
                  title: Text(
                    u.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Text(u.id.toString()),
                  subtitle: Text("${u.email} | ${u.company.name}"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return IndividualUser(user: u);
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

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(this.id, this.name, this.email, this.address, this.phone, this.website,
      this.company);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        phone = json["phone"],
        website = json["website"],
        address = Address.fromJson(json["address"]),
        company = Company.fromJson(json["company"]);

  static Future<User> fromId(int id) async {
    String url = "https://jsonplaceholder.typicode.com/users/${id}";
    if (Cache.cache[url] != null) {
      _addToCache(id, url);
    }
    return User.fromJson(jsonDecode(Cache.cache[url]!));
  }

  static void _addToCache(int id, String url) async {
    Future<http.Response> response = http.get(Uri.parse(url));
    await response;
    response.then((value) => {Cache.cache[url] = value.body});
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(this.street, this.suite, this.city, this.zipcode);

  Address.fromJson(Map<String, dynamic> json)
      : street = json["street"],
        suite = json["suite"],
        city = json["city"],
        zipcode = json["zipcode"];
}

class Company {
  final String name;
  final String catchphrase;
  final String bs;

  Company(this.name, this.catchphrase, this.bs);

  Company.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        catchphrase = json["catchPhrase"],
        bs = json["bs"];
}
