class BeerSong
  def self.recite(initial_bottles, verses_count)
    new(initial_bottles, verses_count).recite
  end

  def initialize(initial_bottles, verses_count)
    @initial_bottles = initial_bottles
    @last_bottle     = initial_bottles - verses_count + 1
  end

  def recite
    verses.join("\n\n") + "\n"
  end

  private

  attr_reader :initial_bottles, :last_bottle

  def verses
    [].tap do |verses|
      initial_bottles.downto(last_bottle) do |number|
        verses << verse_for(number)
      end
    end
  end

  def verse_for(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall."
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall."
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
    end
  end
end
