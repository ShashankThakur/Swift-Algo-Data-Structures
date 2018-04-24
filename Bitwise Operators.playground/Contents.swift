//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//setting n th bit of number m
func setBit(num:inout Int, postion:Int) {
    let moved = 1 << postion
    num = num | moved
}


//unset/clear  a bit in n th position
func clearBit(num:inout Int, pos:Int) {
    let mask = ~(1 << pos)
    num = num & mask
}

//toggle a bit in nth position
func toggleBit(num:inout Int,pos:Int) {
    let mask = 1 << pos
    num = num ^ mask
}

//check if a bit is set or not
func checkBitSet(num:Int, pos:Int) ->Bool{
    let mask = 1 << pos
    let result = num & mask
    return result != 0 ? true: false
}
