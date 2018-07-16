//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 
 Example 1:
 
 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:
 
 Input: "race a car"
 Output: false
 
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if(s.isEmpty || s.count == 1){return true}
        
        var input = s
        let unsafeChars = CharacterSet.alphanumerics.inverted
        input  = input.components(separatedBy: unsafeChars).joined(separator: "").lowercased()
        let inputArray = Array(input)
        var i = 0
        var j = inputArray.count - 1
        while (i < j) {
            if(inputArray[i] != inputArray[j]) {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
