//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
Given a string, determine if a permutation of the string could form a palindrome.

Example 1:

Input: "code"
Output: false
Example 2:

Input: "aab"
Output: true
Example 3:

Input: "carerac"
Output: true
*/

class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        if(s.isEmpty) {
            return true
        }
        var dict = [Character:Int]()
        for i in s {
            if let entry = dict[i] {
                dict[i] = nil
            }
            else {
                dict[i] = 1
            }
        }
        if (dict.count == 1 || dict.count == 0) {
            return true
        }
        return false
    }
}
