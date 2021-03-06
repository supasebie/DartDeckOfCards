void main() {
  var deck = new Deck();

  deck.removeCard("Hearts", "One");
  
  print(deck);
}

class Deck {
  List<Card> cards = [];

  Deck() {
    var suits = ["Hearts", "Diamonds", "Clubs", "Spades"];
    var ranks = [
      "One",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King",
      "Ace"
    ];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(
          suit: suit, 
          rank: rank
        );
        cards.add(card);
      }
    }
  }

  toString() {
    return cards.toString();
  }

  shuffle() {
    cards.shuffle();
  }

  cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize, cards.length);

    return hand;
  }

  removeCard(String suit, String rank) {
    cards.removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

class Card {
  String suit;
  String rank;

  Card({this.suit, this.rank});

  toString() {
    return '$rank of $suit';
  }
}
