//: Playground - noun: a place where people can play

import UIKit

/*
 Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.  Return a list of all possible strings we could create.
 
 Examples:
 Input: S = "a1b2"
 Output: ["a1b2", "a1B2", "A1b2", "A1B2"]
 
 Input: S = "3z4"
 Output: ["3z4", "3Z4"]
 
 Input: S = "12345"
 Output: ["12345"]
 */


//extension String {
//    subscript (i:Int) ->Character {
//        let index = self.index(self.startIndex, offsetBy: i)
//        return self[index]
//    }
//}

func letterCasePermutation(_ s:String) ->[String] {
    if(s.isEmpty) {
        return [String]()
    }
    var result = [String]()
    result.append(s)
    for (k,i) in s.enumerated() {
        if(Int(String(i)) != nil) {
            continue
        }
        for j in 0..<result.count {
            var entry = Array(result[j])
            entry[k] = Character(String(entry[k]).uppercased())
            result.append(String(entry))
        }
        
    }
    return result
}
letterCasePermutation("a1b2")
