//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Solution {
    func rob(_ nums: [Int]) -> Int {
        let length = nums.count
        if(length == 0) {return 0}
        if(length == 1) {return nums[0]}
        if(length == 2) {
            return nums[0] > nums[1] ? nums[0]:nums[1]
        }
        var dp = Array(repeating:0,count:length + 1)
        dp[0] = 0
        dp[1] = nums[0]
        for i in 1..<length {
            dp[i+1] = max(dp[i],nums[i]+dp[i-1]);
        }
        return dp[length]
    }
}
