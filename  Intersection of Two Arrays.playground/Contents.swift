//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 Given two arrays, write a function to compute their intersection.
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
 
 Note:
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 Follow up:
 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 */


class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        var dict = [Int:Int]()
        for i in nums1 {
            if(dict[i] != nil) {
                dict[i]! += 1
            }
            else {
                dict[i] = 1
            }
        }
        for i in nums2 {
            if let entry = dict[i] {
                if entry != 0 {
                    result.append(i)
                    dict[i]! -= 1
                }
            }
        }
        return result
    }
}
