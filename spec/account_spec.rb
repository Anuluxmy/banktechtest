require 'account.rb'
describe Account do
  it 'starting balance of the account' do
    account = Account.new(0)
    expect(account.balance).to eq (0)
  end
end

describe '#deposit' do
    let(:deposit_date) { "10/01/2012" }
    let(:deposit_amount) { 1000 }
    context "given amount and date" do
    it 'can be able to deposit money into the account' do
    account = Account.new(0)
    expect{ account.deposit(deposit_date, deposit_amount) }.to change{ account.balance }.by deposit_amount
  end
 end
end

describe '#withdraw' do
  let(:deposit_date) { "10/01/2012" }
  let(:deposit_amount) { 1000 }
  let(:withdraw_date) { "14/01/20012" }
  let(:withdraw_amount) { 500 }
  context "given amount and date" do
    it 'can be able to withdraw money from account' do
      account = Account.new(1000)
      account.deposit(deposit_date, deposit_amount)
      expect{ account.withdraw(withdraw_date, withdraw_amount) }.to change{ account.balance }.by -(withdraw_amount)
    end
  end
end

describe '#statement' do
  let(:deposit_date) { "10/01/2012" }
  let(:deposit_amount) { 1000 }
  let(:withdraw_date) { "14/01/20012" }
  let(:withdraw_amount) { 500 }
  context "prints the statement" do
    it 'can print out the statement' do
      account = Account.new(1000)
      account.deposit(deposit_date, deposit_amount)
      account.withdraw(withdraw_date, withdraw_amount)
      expect{ account.statement }.to output{ "date     || credit ||  debit  ||  balance
10/01/2012  ||  1000  ||  0   ||  2000
14/01/2012  ||    ||  500   ||  1500" }.to_stdout
    end
  end
end
