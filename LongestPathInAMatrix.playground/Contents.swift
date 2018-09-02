//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//reference - https://leetcode.com/problems/longest-increasing-path-in-a-matrix/description/

/*
 Given an integer matrix, find the length of the longest increasing path.
 
 From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).
 
 Example 1:
 
 Input: nums =
 [
 [9,9,4],
 [6,6,8],
 [2,1,1]
 ]
 Output: 4
 Explanation: The longest increasing path is [1, 2, 6, 9].
 Example 2:
 
 Input: nums =
 [
 [3,4,5],
 [3,2,6],
 [2,2,1]
 ]
 Output: 4
 Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.
 */

class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        if(matrix.count == 0 || matrix[0].count == 0) {
            return 0
        }
        let m = matrix.count
        let n = matrix[0].count
        var maxValue = 0
        var cache = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                let len = dfsHelper(i,j,m,n,matrix,&cache)
                maxValue = max(maxValue,len)
            }
        }
        return maxValue
    }
    
    func dfsHelper(_ i:Int, _ j :Int, _ rows:Int, _ cols:Int, _ matrix:[[Int]], _ cache:inout [[Int]]) ->Int {
        if(cache[i][j] != 0) {
            return cache[i][j]
        }
        var maxValue = 1
        let moves = [[1,0],[0,1],[-1,0],[0,-1]]
        for move in moves {
            let x = i + move[0]
            let y = j + move[1]
            if(x < 0 || x >= rows || y < 0 || y >= cols || matrix[x][y] <= matrix[i][j]) {
                continue
            }
            let len = 1 + dfsHelper(x,y,rows,cols,matrix,&cache)
            maxValue = max(maxValue,len)
        }
        cache[i][j] = maxValue
        return maxValue
    }
}
