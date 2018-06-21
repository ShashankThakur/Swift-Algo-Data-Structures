//: Playground - noun: a place where people can play

import UIKit

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        if(n == 0) {
            return result
        }
        
        generateParenthesisUtil(&result,"",n,0,0)
        return result
    }
    
    private func generateParenthesisUtil(_ result:inout [String],_ str: String, _ n:Int, _ left:Int, _ right:Int) {
        if right == n {
            result.append(str)
            return
        }
        if (left < n) {
            let s = str + "("
            generateParenthesisUtil(&result,s, n, left + 1, right)
        }
        if(left > right) {
            let s = str + ")"
            generateParenthesisUtil(&result,s, n, left, right + 1)
        }
    }
}
var sol = Solution()
sol.generateParenthesis(3)
