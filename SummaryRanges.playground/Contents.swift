//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Reference - https://leetcode.com/problems/summary-ranges/description/

/*
Given a sorted integer array without duplicates, return the summary of its ranges.

Example 1:

Input:  [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
Example 2:

Input:  [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]
Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range
 */

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var result = [String]()
        if(nums.count == 0) {
            return result
        }
        var start = nums[0]
        var end = nums[0]
        for i in 1..<nums.count {
            if(nums[i-1] + 1 == nums[i]){
                end = nums[i]
            }
            else {
                if(start != end) {
                    result.append("\(start)->\(end)")
                }
                else {
                    result.append("\(start)")
                }
                start = nums[i]
                end = nums[i]
            }
        }
        if(start != end) {
            result.append("\(start)->\(end)")
        }
        else {
            result.append("\(start)")
        }
        return result
    }
}
