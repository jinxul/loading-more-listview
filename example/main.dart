import 'dart:math';

import 'package:flutter/material.dart';

import 'package:loading_more_listview/loading_more_listview.dart';

void main() => runApp(ExamplePage());

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  List<String> _list = <String>[
    'item: 1',
    'item: 2',
    'item: 3',
    'item: 4',
    'item: 5',
    'item: 6',
    'item: 7',
    'item: 8',
    'item: 9',
    'item: 10',
  ];
  bool _enableLoadMore = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoadingMore ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LoadingMore ListView Example'),
        ),
        body: LoadMoreListView(
          itemCount: _list.length,
          enableLoadMore: _enableLoadMore,
          itemBuilder: _itemBuilder,
          onLoadMore: _onLoadMore,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: FlutterLogo(),
      title: Text(
        _list.elementAt(index),
      ),
    );
  }

  void _onLoadMore() {
    setState(() {
      _list.addAll(_generateItems());
      _enableLoadMore = _list.length < 30;
    });
  }

  List<String> _generateItems() {
    final Random random = Random();
    return List<String>.generate(
      10,
      (_) => 'generated Item: ${random.nextInt(256)}',
    );
  }
}
