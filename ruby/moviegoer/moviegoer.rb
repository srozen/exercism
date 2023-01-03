# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError; end

class Moviegoer
  MAJORITY_AGE = 18
  SENIOR_AGE = 60
  SENIOR_PRICE = 10.0
  REGULAR_PRICE = 15.0

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age >= SENIOR_AGE ? SENIOR_PRICE : REGULAR_PRICE
  end

  def watch_scary_movie?
    @age >= MAJORITY_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless @member

    '🍿'
  end
end
