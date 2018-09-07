//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Count all possible paths from top left to bottom right of a mXn matrix
 The problem is to count all the possible paths from top left to bottom right of a mXn matrix with the constraints that from each cell you can either move only to right or down
 
 Reference - https://practice.geeksforgeeks.org/problems/number-of-paths/0
 */

func numberOfPaths(_ rows:Int, cols:Int) ->Int {
    var count = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    //number of paths to reach any col in row 1
    for i in 0..<cols {
        count[0][i] = 1
    }
    
    //number of paths to reach any row in col 1
    for i in 0..<rows {
        count[i][0] = 1
    }
    for i in 1..<rows {
        for j in 1..<cols {
            count[i][j] = count[i-1][j] + count[i][j-1]
        }
    }
    return count[rows-1][cols-1]
}

numberOfPaths(3, cols: 3)
