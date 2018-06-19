//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var stairList = Array(repeating:0,count:n)
        if(n == 0) {return 0}
        if(n == 1) {return 1}
        if(n == 2) {return 2}
        
        stairList[0] = 1
        stairList[1] = 2
        for i in 2..<n {
            stairList[i] = stairList[i-1] + stairList[i-2]
        }
        return stairList[n-1]
    }
}
