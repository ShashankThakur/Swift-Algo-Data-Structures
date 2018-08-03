//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var result = [String]()
        var dict:[Character:String] = [
            "0":"",
            "1":"",
            "2":"abc",
            "3":"def",
            "4":"ghi",
            "5":"jkl",
            "6":"mno",
            "7":"pqrs",
            "8":"tuv",
            "9":"wxyz"
        ]
        
        if(digits == nil || digits.isEmpty) {
            return result
        }
        helper(digits,"", &result, dict)
        return result
        
    }
    func helper(_ restOfWord: String, _ pathSoFar:String, _ result:inout [String],_ dict:[Character:String]) {
        if(restOfWord.isEmpty) {
            result.append(pathSoFar)
            return
        }
        let first = restOfWord[restOfWord.startIndex]
        var rest = ""
        if (restOfWord.count >= 2) {
            rest = String(restOfWord[restOfWord.index(restOfWord.startIndex, offsetBy: 1)..<restOfWord.endIndex])
        }
        
        let letters = dict[first]!
        for letter in letters {
            helper(rest, pathSoFar + "\(letter)", &result, dict)
        }
    }
}
