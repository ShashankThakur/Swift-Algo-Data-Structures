//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Reference - https://leetcode.com/problems/trapping-rain-water/description/

class Solution {
    func trap(_ height: [Int]) -> Int {
        if(height.count == 0) {
            return 0
        }
        var result = 0
        var left = 0, right = height.count - 1
        var leftMax = 0
        var rightMax = 0
        while (left < right) {
            if(height[left] < height[right]) {
                if(height[left] >= leftMax) {
                    leftMax = height[left]
                }
                else {
                    result = result + leftMax - height[left]
                }
                left += 1
                
            }
            else {
                if(height[right] >= rightMax) {
                    rightMax = height[right]
                }
                else {
                    result = result + rightMax - height[right]
                }
                right -= 1
            }
        }
        return result
    }
}
