import UIKit

var str = "Hello, playground"
//reference - https://leetcode.com/problems/word-search/
/*
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example:
 
 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 
 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
 */

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if(board.count == 0 || board[0].count == 0) {
            return false
        }
        let charArray = Array(word)
        let rows = board.count
        let cols = board[0].count
        var visited = Array(repeating:Array(repeating:false,count:cols),count:rows)
        
        for i in 0..<rows {
            for j in 0..<cols {
                if(board[i][j] == charArray[0]) {
                    if(searchHelper(i,j,rows,cols,charArray,0, board, &visited))
                    {return true}
                }
            }
        }
        return false
    }
    func searchHelper(_ i:Int, _ j:Int, _ rows:Int, _ cols:Int, _ charArray:[Character], _ index:Int, _ board:[[Character]], _ visited:inout [[Bool]]) ->Bool {
        if(index == charArray.count) {
            return true
        }
        if(i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != charArray[index] || visited[i][j]) {
            return false
        }
        
        visited[i][j] = true
        let moves = [[1,0],[0,1],[-1,0],[0,-1]]
        for move in moves {
            let x = i + move[0]
            let y = j + move[1]
            let exists = searchHelper(x,y, rows,cols, charArray, index+1,board, &visited)
            if(exists){
                return true
            }
        }
        visited[i][j] = false
        return false
    }
}
