//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
 
 Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
 
 
 Example 1:
 
 Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
 Output: True
 Explanation:
 1234
 5123
 9512
 
 In the above grid, the diagonals are "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]", and in ea
 
 */


//Complexity - O(m * n)
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                if(matrix[i][j] != matrix[i+1][j+1]) {
                    return false
                }
            }
        }
        return true
    }
}
