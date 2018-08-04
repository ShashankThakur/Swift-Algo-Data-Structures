//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given a collection of intervals, merge all overlapping intervals.
 
 Example 1:
 
 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:
 
 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considerred overlapping.
 */

//Definition for an interval.
  public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
      self.start = start
      self.end = end
    }
 }
 

class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        var startPoints = [Int]()
        var endPoints = [Int]()
        var result = [Interval]()
        for interval in intervals {
            startPoints.append(interval.start)
            endPoints.append(interval.end)
        }
        startPoints.sort()
        endPoints.sort()
        let n = intervals.count
        var j = 0
        for i in 0..<n {
            if(i == n - 1 || startPoints[i + 1] > endPoints[i]) {
                let interval = Interval(startPoints[j], endPoints[i])
                result.append(interval)
                j = i + 1
            }
        }
        return result
    }
}
