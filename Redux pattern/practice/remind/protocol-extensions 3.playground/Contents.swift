
import UIKit

protocol Account {
    
    var balance: Double { get set }
    
    mutating func deposit(_ amount: Double)
    mutating func withdraw(_ amount: Double)
    mutating func transfer(from: inout Account, to: inout Account, amount: Double)
    func calculateInterestEarned() -> Double
}

extension Account {
    
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
    
    func calculateInterestEarned() -> Double {
           return (balance * (0.1/100))
    }
    
}

struct CheckingAccount: Account {
    
    var balance: Double
    
    func calculateInterestEarned() -> Double {
           return (balance * (0.2/100))
    }
    
    func transfer(from: inout Account, to: inout Account, amount: Double) {
        from.withdraw(amount)
        to.deposit(amount)
    }
    
}

struct MoneyMarketAccount: Account {
    var balance: Double
    
    func transfer(from: inout Account, to: inout Account, amount: Double) {
        from.withdraw(amount+100)
        to.deposit(amount+55)
    }
    
    
//    var balance: Double
//
//    func calculateInterestEarned() -> Double {
//           return (balance * (0.4/100))
//    }
//
//    func transfer(from: inout Account, to: inout Account, amount: Double) {
//
//    }
}

let checkingAccount = CheckingAccount(balance: 100)
var account1:Account = MoneyMarketAccount(balance: 100.0)
var account2:Account = MoneyMarketAccount(balance: 200.0)
let gi = MoneyMarketAccount(balance: 100.0)
gi.transfer(from: &account2, to: &account1, amount: 55)
account1.balance
account2.balance
//gi.transfer(from: $account1, to: $account2, amount: 300.0)

