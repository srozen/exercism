=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end
module TwelveDays
  class << self
    PRESENTS_PER_DAY = {
      "first" => ", and a Partridge",
      "second" => ", two Turtle Doves",
      "third" => ", three French Hens",
      "fourth" => ", four Calling Birds",
      "fifth" => ", five Gold Rings",
      "sixth" => ", six Geese-a-Laying",
      "seventh" => ", seven Swans-a-Swimming",
      "eighth" => ", eight Maids-a-Milking",
      "ninth" => ", nine Ladies Dancing",
      "tenth" => ", ten Lords-a-Leaping",
      "eleventh" => ", eleven Pipers Piping",
      "twelfth" => ", twelve Drummers Drumming"
    }.freeze

    def song
      PRESENTS_PER_DAY.each_with_object({lyrics: "", past_presents: ""}) do |(day, present), result|
        result[:lyrics] << "On the #{day} day of Christmas my true love gave to me: #{present.gsub(/,( and)? /, "")}#{result[:past_presents]} in a Pear Tree.\n"
        result[:lyrics] << "\n" unless day == "twelfth"
        result[:past_presents] = present << result[:past_presents]
      end[:lyrics]
    end
  end
end