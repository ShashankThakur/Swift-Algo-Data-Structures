//: Playground - noun: a place where people can play

import UIKit

/*Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var inputGrid = grid
        let m = grid.count
        let n = grid[0].count
        var count = 0
        for i in 0..<m {
            for j in 0..<n {
                if(inputGrid[i][j] == "1") {
                    helperDFS(i,j,m,n,&inputGrid)
                    count += 1
                }
            }
        }
        return count
    }
    
    func helperDFS(_ i:Int, _ j:Int, _ row:Int, _ col:Int, _ grid:inout [[Character]]) {
        if(i < 0 || i >= row || j < 0 || j >= col || grid[i][j] == "0") {
            return
        }
        grid[i][j] = "0"
        let moves = [[0,1],[0,-1],[1,0],[-1,0]]
        for move in moves {
            helperDFS(i + move[0], j + move[1], row, col, &grid)
        }
    }
}
