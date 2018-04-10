//: Playground - noun: a place where people can play

/*Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 1. Integers in each row are sorted in ascending from left to right.
 2. Integers in each column are sorted in ascending from top to bottom.*/

import UIKit

var input = [[1,2,3],[4,5,6],[7,8,9]]

func searchMatrix<T:Comparable>(a:[[T]],searchedItem:T) ->Bool
{
    if(a.count == 0 || a[0].count == 0)
    {
        return false
    }
    var row = 0
    var col = a[0].count - 1
    while (row < a.count && col >= 0)
    {
        if(searchedItem < a[row][col])
        {
            col--
        }
        else if(searchedItem > a[row][col])
        {
            row++
        }
        else if(searchedItem == a[row][col]){
            return true
        }
    }
    return false
}

searchMatrix(input, searchedItem: 5)
