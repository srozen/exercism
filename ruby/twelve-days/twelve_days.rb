# frozen_string_literal: true

module TwelveDays
  PRESENTS_DAYS = {
    "first": 'a Partridge in a Pear Tree',
    "second": 'two Turtle Doves',
    "third": 'three French Hens',
    "fourth": 'four Calling Birds',
    "fifth": 'five Gold Rings',
    "sixth": 'six Geese-a-Laying',
    "seventh": 'seven Swans-a-Swimming',
    "eighth": 'eight Maids-a-Milking',
    "ninth": 'nine Ladies Dancing',
    "tenth": 'ten Lords-a-Leaping',
    "eleventh": 'eleven Pipers Piping',
    "twelfth": 'twelve Drummers Drumming'
  }.freeze

  def self.song
    presents = ''
    lyrics = ''

    PRESENTS_DAYS.each_pair do |day, present|
      next_sequence = presents.empty? ? ', and ' : ', '
      presents = present + presents
      lyrics += TwelveDays.verse(day, presents)
      presents = next_sequence + presents
    end

    lyrics[0...-1]
  end

  def self.verse(day, present)
    "On the #{day} day of Christmas my true love gave to me: #{present}.\n\n"
  end
end
