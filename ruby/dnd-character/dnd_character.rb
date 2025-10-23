=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  BASE_HITPOINTS = 10

  attr_accessor :strength
  attr_accessor :dexterity
  attr_accessor :constitution
  attr_accessor :intelligence
  attr_accessor :wisdom
  attr_accessor :charisma
  attr_accessor :hitpoints

  def initialize
    @strength = dice_rolls
    @dexterity = dice_rolls
    @constitution = dice_rolls
    @intelligence = dice_rolls
    @wisdom = dice_rolls
    @charisma = dice_rolls
    @hitpoints = BASE_HITPOINTS + DndCharacter.modifier(@constitution)
  end

  def self.modifier(constitution)
    ((constitution - 10) / 2).floor
  end

  private

  def dice_rolls
    rolls = Array.new(4) { rand(1..6) }
    rolls.sum - rolls.min
  end
end
