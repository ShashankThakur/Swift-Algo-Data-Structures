//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 Given an integer, write a function to determine if it is a power of two.
 
 Example 1:
 
 Input: 1
 Output: true
 Explanation: 20 = 1
 Example 2:
 
 Input: 16
 Output: true
 Explanation: 24 = 16
 Example 3:
 
 Input: 218
 Output: false
 */

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if(n == 0) {
            return false
        }
        if(n == 1) {
            return true
        }
        return (n & (n-1)) == 0
    }
}
