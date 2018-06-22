//: Playground - noun: a place where people can play

import UIKit

/*
 Given a binary array, find the maximum number of consecutive 1s in this array.
 
 Example 1:
 Input: [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s.
 The maximum number of consecutive 1s is 3.
 Note:
 
 The input array will only contain 0 and 1.
 The length of input array is a positive integer and will not exceed 10,000
 
 */

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxValue = 0
        var temp = 0
        for i in 0..<nums.count {
            if (nums[i] == 1)
            {
                temp += 1
            }
            else {
                temp = 0
            }
            maxValue = max(maxValue,temp)
            
            
        }
        return maxValue
    }
}
