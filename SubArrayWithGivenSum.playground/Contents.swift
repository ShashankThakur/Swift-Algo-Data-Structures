//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Input: arr[] = {1, 4, 20, 3, 10, 5}, sum = 33
 Ouptut: Sum found between indexes 2 and 4
 */

func subArrayWithGivenSum(_ input:[Int],k:Int) ->Bool{
    if (input.count == 0 && k != 0) {
        return false
    }
    var dict = [Int:Int]()
    var sum = 0
    for i in 0..<input.count {
        sum = sum + input[i]
        if(sum == k) {
            print("indexs are 0 and \(i)")
            return true
        }
        if let diff = dict[sum - k] {
            print("indexs are \(diff + 1) and \(i)")
            return  true
        }
        dict[sum] = i
    }
    return false
}

12   << 1
