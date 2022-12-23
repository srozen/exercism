module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * interest_rate(balance) * 0.01)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    return 0 if current_balance.negative?

    count_year_before_balance(0, current_balance, desired_balance)
  end

  def self.count_year_before_balance(year_counter, current_balance, desired_balance)
    return year_counter if current_balance > desired_balance

    count_year_before_balance(year_counter + 1, annual_balance_update(current_balance), desired_balance)
  end
end
