//: Playground - noun: a place where people can play

import UIKit

/*
 You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.
 
 Note: You can assume that
 
 0 <= amount <= 5000
 1 <= coin <= 5000
 the number of coins is less than 500
 the answer is guaranteed to fit into signed 32-bit integer
 Example 1:
 
 Input: amount = 5, coins = [1, 2, 5]
 Output: 4
 Explanation: there are four ways to make up the amount:
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 */

class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else {
            return 1
        }
        var table = Array(repeating:0,count:amount+1)
        table[0] = 1
        for coin in coins  {
            for i in 1...amount {
                if i >= coin {
                    table[i] += table[i - coin]
                }
            }
        }
        return table[amount]
    }
}
