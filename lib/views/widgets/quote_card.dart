import 'package:flutter/material.dart';
import '../../models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onFavoriteToggle;

  QuoteCard({required this.quote, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFCEABB),
            Color(0xFFFFDEE9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(
            quote.text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "- ${quote.author}",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          trailing: IconButton(
            icon: Icon(
              quote.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: quote.isFavorite ? Colors.red : Colors.grey[600],
            ),
            onPressed: onFavoriteToggle,
          ),
        ),
      ),
    );
  }
}
