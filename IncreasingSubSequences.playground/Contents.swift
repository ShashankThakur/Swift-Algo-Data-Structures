//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given an integer array, your task is to find all the different possible increasing subsequences of the given array, and the length of an increasing subsequence should be at least 2 .
 
 Example:
 Input: [4, 6, 7, 7]
 Output: [[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]]
 */

class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var list = [Int]()
        subsequenceUtil(&list,0,nums,&result)
        return result
    }
    func subsequenceUtil(_ list:inout [Int],_ index:Int, _ nums:[Int], _ result:inout [[Int]]) {
        if (list.count > 1) {
            result.append(list)
        }
        var visited:Set<Int> = []
        for i in index..<nums.count {
            if(visited.contains(nums[i])){continue}
            if(list.count == 0 || list.last! <= nums[i]){
                visited.insert(nums[i])
                list.append(nums[i])
                subsequenceUtil(&list, i + 1,nums,&result)
                list.removeLast()
            }
        }
    }
}
