import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class JsonState<T> extends State {
  Future<http.Response>? _response;
  Future<http.Response>? get getResponse => _response;

  String get url;
  void onResponseGet(String responseBody);

  @override
  void initState() {
    super.initState();
    _response = http.get(Uri.parse(url));
    if(Cache.cache[url] != null) onResponseGet(Cache.cache[url].toString());
    _notifier();
  }

  void _notifier() async {
    await _response?.then((value) => {
      Cache.cache.putIfAbsent(url, () => value.body),
      onResponseGet(value.body)
    });
  }
}

class Cache {
  static Map<String, String> cache = {};
}