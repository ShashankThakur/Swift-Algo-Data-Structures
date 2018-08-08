//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 Example 1:
 
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:
 
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if (nums.count == 0) {
            return -1
        }
        var low = 0
        var high = nums.count - 1
        while (low <= high) {
            let mid = (low + high)/2
            if(target == nums[mid]) {
                return mid
            }
            if(nums[low] <= nums[mid]){
                if(nums[low] <= target && target <= nums[mid]) {
                    high = mid - 1
                }
                else {
                    low = mid + 1
                }
            }
            else {
                if(nums[mid] <= nums[high]) {
                    if(nums[mid] <= target && target <= nums[high]) {
                        low = mid + 1
                    }
                    else {
                        high = mid - 1
                    }
                }
            }
        }
        return -1
    }
}
