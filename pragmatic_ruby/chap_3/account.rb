class Account
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def transfer(account_to_transfer, amount)
     debit(amount)
     credit(account_to_transfer, amount)
  end

  def credit(account, amount)
     account.balance -= amount
  end

  def debit(amount)
    @balance += amount
  end

  public :transfer
  private :debit, :credit

end

account_a = Account.new(500)
account_b = Account.new(300)

account_a.transfer(account_b, 100)
p "Account A: #{account_a.balance}" #=> Account A: 600
p "Account b: #{account_b.balance}" #=> Account B: 200

account_a.debit(100)
