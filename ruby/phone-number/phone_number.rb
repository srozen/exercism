# frozen_string_literal: true

class PhoneNumber
  NANP_REGEX = /^1?([2-9]\d{2}[2-9]\d{6})\z/.freeze
  class << self
    def clean(phone_number)
      phone_number.gsub!(/\D/, '')
      return nil unless [10, 11].include? phone_number.length

      phone_number.match(NANP_REGEX)&.[](1)
    end
  end
end
