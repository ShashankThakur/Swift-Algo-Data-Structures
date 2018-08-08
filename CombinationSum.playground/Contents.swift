//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
 [7],
 [2,2,3]
 ]
 Example 2:
 
 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
 [2,2,2,2],
 [2,3,3],
 [3,5]
 ]
 */

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        if(candidates.count == 0) {
            return result
        }
        let list = [Int]()
        
        backTrackHelper(&result, candidates, list, target, 0)
        return result
    }
    
    func backTrackHelper(_ result:inout [[Int]], _ candidates:[Int], _ list:[Int], _ remain:Int, _ start:Int) {
        var tempList = list
        if(remain < 0) {
            return
        }
        else if(remain == 0){
            result.append(list)
        }
        else {
            for i in start..<candidates.count {
                tempList.append(candidates[i])
                backTrackHelper(&result, candidates, tempList, remain - candidates[i], i)
                tempList.removeLast()
            }
        }
        
    }
}
