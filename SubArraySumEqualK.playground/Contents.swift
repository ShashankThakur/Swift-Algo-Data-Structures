//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
 
 Example 1:
 Input:nums = [1,1,1], k = 2
 Output: 2
 Note:
 The length of the array is in range [1, 20,000].
 The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
 */


//Time complexity - O(n)
//Space complexity - O(n)
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int:Int]()
        var sum = 0
        dict[sum] = 1
        var count = 0
        
        //Maintain pre sum value and check. Also update the count of sum seen before if you see them again.
        for i in 0..<nums.count {
            sum = sum + nums[i]
            if let entry = dict[sum - k]{
                count = count + entry
            }
            if(dict[sum] != nil) {
                dict[sum]! += 1
            }
            else {
                dict[sum] = 1
            }
        }
        return count
    }
}
