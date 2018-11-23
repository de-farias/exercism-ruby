class TwelveDays
  GIFTS = [
    'a Partridge in a Pear Tree.',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ]

  def self.song(verses_count = 12)
    verses = (0...verses_count).map { |verse_index| verse(verse_index) }

    verses.join("\n\n") + "\n"
  end

  def self.verse(verse_index)
    verse_intro = intro(verse_index)
    verse_gifts = gifts(verse_index + 1)

    "#{verse_intro}#{verse_gifts}"
  end

  def self.intro(day)
    "On the #{ordinal(day)} day of Christmas my true love gave to me: "
  end

  def self.gifts(gifts_count)
    gifts_list = GIFTS.first(gifts_count).reverse

    if gifts_list.length == 1
      gifts_list[0]
    else
      gifts_list[0...-1].join(', ') + ', and ' + gifts_list[-1]
    end
  end

  def self.ordinal(day)
    ordinals = %w[
      first
      second
      third
      fourth
      fifth
      sixth
      seventh
      eighth
      ninth
      tenth
      eleventh
      twelfth
    ]

    ordinals[day]
  end
end
