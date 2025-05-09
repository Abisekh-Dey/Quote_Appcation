import 'package:flutter/material.dart';
import 'controllers/quote_controller.dart';
import 'views/home_screen.dart';
import 'views/favorites_screen.dart';

class QuotesApp extends StatefulWidget {
  @override
  _QuotesAppState createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  int _currentIndex = 0;
  final QuoteController _controller = QuoteController();

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(controller: _controller, refresh: _refresh),
      FavoritesScreen(controller: _controller, refresh: _refresh),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Quotes App", style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.blue[100],),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.format_quote), label: "All Quotes"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}
