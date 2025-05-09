import '../models/quote.dart';
import '../data/quote_data.dart';

class QuoteController {
  List<Quote> _quotes = quotesData; 

  List<Quote> get quotes => _quotes;
  List<Quote> get favoriteQuotes => _quotes.where((q) => q.isFavorite).toList();

  void toggleFavorite(Quote quote) {
    quote.isFavorite = !quote.isFavorite;
  }
}
