//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."

Example:

Input: citations = [3,0,6,1,5]
Output: 3
Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had
received 3, 0, 6, 1, 5 citations respectively.
Since the researcher has 3 papers with at least 3 citations each and the remaining
two with no more than 3 citations each, her h-index is 3.
 */
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        if (n == 0) {return 0}
        var array = Array(repeating:0,count:n + 1)
        for i in 0..<n {
            if(citations[i] > n) {
                array[n] += 1
            }
            else
            {
                array[citations[i]] += 1
            }
        }
        var t = 0
        var result = 0
        for i in (0...n).reversed() {
            t = t + array[i]
            if(t >= i) {
                return i
            }
        }
        return 0
    }
}
