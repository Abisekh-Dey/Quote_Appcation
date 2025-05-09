import 'package:flutter/material.dart';
import '../controllers/quote_controller.dart';
import 'widgets/quote_card.dart';

class FavoritesScreen extends StatelessWidget {
  final QuoteController controller;
  final VoidCallback refresh;

  FavoritesScreen({required this.controller, required this.refresh});

  @override
  Widget build(BuildContext context) {
    final quotes = controller.favoriteQuotes;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFAF3DD),
              Color(0xFFE0F7FA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: quotes.isEmpty
            ? Center(child: Text("No favorites yet."))
            : ListView.builder(
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
