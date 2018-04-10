//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public func letterCombinations(digits:String?) ->[String]
{

    var result = [String]()
    let keyMap = [[],[],["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
    let single = ""
    if digits == nil
    {
        return result
    }
    if (digits!.isEmpty)
    {
        return result
    }
    let digitsArray = Array(digits!.characters)
    helper(&result, single: single, digits: digitsArray, keyMap: keyMap, start: 0)
    return result
    
}
private func helper(inout result:[String],var single:String, digits:[Character], keyMap:[[String]],start:Int)
{
    if(start >= digits.count)
    {
        result.append(single)
        return
    }
    
    let index = Int(String(digits[start]))
    let current = keyMap[index!]
    for var i = 0; i < current.count; i++
    {
        single = single + current[i]
        helper(&result, single: single, digits: digits, keyMap: keyMap, start: start + 1)
        single = single.substringToIndex(single.endIndex.predecessor())
    }
    
}
letterCombinations("43")
