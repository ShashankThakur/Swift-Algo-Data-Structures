//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var inputArray = [[1,2],[4,5],[7,8]]

func printSprialMatrix(a:[[Int]]) ->[Int]
{
    var result = [Int]()
    if(a.count == 0 || a[0].count == 0)
    {
        return result
    }
    var rowBegin = 0
    var rowEnd = a.count - 1
    
    var colBegin = 0
    var colEnd = a[0].count - 1
    
    
    while (rowBegin <= rowEnd && colBegin <= colEnd)
    {
        //move right
        for (var i = colBegin; i <= colEnd; i++)
        {
            result.append(a[rowBegin][i])
        }
        rowBegin++
        
        //move downn
        for (var i = rowBegin; i <= rowEnd; i++)
        {
            result.append(a[i][colEnd])
        }
        colEnd--
        
        //move left
        
        for (var i = colEnd; i >= colBegin; i--)
        {
            result.append(a[rowEnd][i])
        }
        
        rowEnd--
        
        //move up
        
        for (var i = rowEnd; i >= rowBegin; i--)
        {
            result.append(a[i][colBegin])
        }
        
        colBegin++
        
    }
    return result
    
}
printSprialMatrix(inputArray)