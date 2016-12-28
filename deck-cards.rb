class Card
 attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "Here is the #{self.rank} of #{self.suit}!"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    @ranks = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, "Jack", "Queen", "King"]
    @suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
    
    @ranks.each do |rank|
      @suits.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def deal
    @deck.shift
  end
end

deck = Deck.new
deck.shuffle
deck.deal.output_card
