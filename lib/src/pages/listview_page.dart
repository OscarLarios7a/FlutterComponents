
import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listElements = []; // = [1, 2, 3, 4, 5];
  int _ultimoItem = 0;

  bool _isLoading = false;
  final _duration = const Duration(seconds: 2);
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //print('Scroll..!!')
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('List View'),
      ),
      body: Stack(children: <Widget>[
      _crearListView(),
      _crearLoading(),
      ],)
    );
  }

  Widget _crearListView() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _listElements.length,
        itemBuilder: (BuildContext context, int i) {
          final img = _listElements[i];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300/?image=$img'));
        });
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listElements.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    return  Timer( _duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 500));

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.00,)
        ],
      );
    } else {
      return Container();
    }
  }
}
