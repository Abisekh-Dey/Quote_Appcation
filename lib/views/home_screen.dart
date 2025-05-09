import 'package:flutter/material.dart';
import '../controllers/quote_controller.dart';
import 'widgets/quote_card.dart';

class HomeScreen extends StatelessWidget {
  final QuoteController controller;
  final VoidCallback refresh;

  HomeScreen({required this.controller, required this.refresh});

  @override
  Widget build(BuildContext context) {
    final quotes = controller.quotes;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFAF3EE),
              Color(0xFFE0F7FA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 12),
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return QuoteCard(
              quote: quotes[index],
              onFavoriteToggle: () {
                controller.toggleFavorite(quotes[index]);
                refresh();
              },
            );
          },
        ),
      ),
    );
  }
}
