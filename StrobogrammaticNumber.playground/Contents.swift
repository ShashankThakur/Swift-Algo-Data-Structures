//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

Write a function to determine if a number is strobogrammatic. The number is represented as a string.

For example, the numbers "69", "88", and "818" are all strobogrammatic.
 */

func checkForStrobogrammaticNumber(num:String) ->Bool {
    let dictForStrobogrammatic:[Character:Character] = ["0":"0","1":"1","6":"9","9":"6","8":"8"]
    var l = 0
    var r = num.count - 1
    while (l <= r) {
        if(dictForStrobogrammatic[num[l]] == nil || dictForStrobogrammatic[num[r]] == nil
            || dictForStrobogrammatic[num[l]] != num[r]) {
            return false
        }
        l += 1
        r -= 1
    }
    return true
}

extension String {
    subscript(pos:Int) ->Character {
        let index = self.index(self.startIndex, offsetBy: pos)
        return self[index]
    }
}
checkForStrobogrammaticNumber(num: "69")
