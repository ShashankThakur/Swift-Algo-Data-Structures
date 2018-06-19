//: Playground - noun: a place where people can play

/* Find a subsequence in given array in which the subsequence's elements are
* in sorted order, lowest to highest, and in which the subsequence is as long as possible
*
* Solution :
* Dynamic Programming is used to solve this question. DP equation is
* if(arr[i] > arr[j]) { T[i] = max(T[i], T[j] + 1 }
*
    * Time complexity is O(n^2).
        * Space complexity is O(n)
            *
            * Reference
            * http://en.wikipedia.org/wiki/Longest_increasing_subsequence
* http://www.geeksforgeeks.org/dynamic-programming-set-3-longest-increasing-subsequence/
*/

import UIKit

var str = "Hello, playground"


func longestIncreasingSubSequence(_ nums:[Int]) ->Int {
    if(nums.count == 0){return 0}
    var result = Array(repeating: 1, count: nums.count)
    for i in 1..<nums.count {
        for j in 0..<i {
            if(nums[i] > nums[j]) {
                result[i] = max(result[j] + 1, result[i])
            }
        }
    }
    return result.max()!
}
