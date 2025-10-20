module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else balance >= 5000
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + balance * (interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    working_balance = current_balance
    until working_balance >= desired_balance
      years += 1
      working_balance = annual_balance_update(working_balance)
    end
    years
  end
end
