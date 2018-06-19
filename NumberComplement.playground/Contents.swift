//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
 */
class Solution {
    func findComplement(_ num: Int) -> Int {
        let numberOfBits = (String(num,radix:2)).count
        return ((1 << numberOfBits) - 1) ^ num
    }
    
}
