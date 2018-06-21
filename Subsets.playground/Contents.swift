//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 */


//Complexity - O(n * 2^n)
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let n = nums.count
        if(n == 0) {
            return result
        }
        result.append([])
        for i in nums {
            for j in 0..<result.count {
                var subSet = result[j]
                subSet.append(i)
                result.append(subSet)
            }
        }
        return result
    }
}
