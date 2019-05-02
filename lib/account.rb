class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(date, amount)
    @balance += amount
    @transactions << ["#{date}, #{amount}, 0 , #{@balance}"]
  end

  def withdraw(date, amount)
    @balance -= amount
    @transactions << ["#{date}, 0,  #{amount}, #{@balance}"]
  end

  def statement
    puts '  date     || credit ||  debit  ||  balance '
    puts  @transactions.join('\n').split(',').join('  || ')
  end
end
