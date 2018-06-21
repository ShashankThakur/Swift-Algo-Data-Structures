//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 Example:
 
 [[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]
 
 Answer: 16
 */

//Time complexity = O(row * col)

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
        let row = grid.count
        let col = grid[0].count
        for i in 0..<row {
            for j in 0..<col {
                if(grid[i][j] == 1) {
                    result = result + getIndexPm(i,j,grid)
                }
            }
        }
        return result
    }
    
    func getIndexPm(_ i:Int, _ j:Int, _ grid:[[Int]]) ->Int {
        let moves = [[0,1],[1,0],[-1,0],[0,-1]]
        var sum = 0
        let row = grid.count
        let col = grid[0].count
        for k in 0..<moves.count {
            let x = i + moves[k][0]
            let y = j + moves[k][1]
            if(x >= row || x < 0 || y >= col || y < 0 || grid[x][y] != 1) {
                sum = sum + 1
            }
        }
        return sum
    }
}
