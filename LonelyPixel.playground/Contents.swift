//: Playground - noun: a place where people can play

import UIKit


/*
 Given a picture consisting of black and white pixels, find the number of black lonely pixels.
 
 The picture is represented by a 2D char array consisting of 'B' and 'W', which means black and white pixels respectively.
 
 A black lonely pixel is character 'B' that located at a specific position where the same row and same column don't have any other black pixels.
 
 Example:
 
 Input:
 [['W', 'W', 'B'],
 ['W', 'B', 'W'],
 ['B', 'W', 'W']]
 
 Output: 3
 Explanation: All the three 'B's are black lonely pixels.
 
 
 Note:
 
 The range of width and height of the input 2D array is [1,500].
*/




var str = "Hello, playground"

func findLonelyPixels(picture:[[String]]) -> Int {
    let row = picture.count
    let col = picture[0].count
    var lonelyCount = 0
    var rowCount = Array(repeatElement(0, count: row))
    var colCount = Array(repeatElement(0, count: col))

    for i in 0..<row {
        for j in 0..<col {
            if(picture[i][j] == "B") {
                rowCount[i] += 1
                colCount[j] += 1

            }
        }
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if(picture[i][j] == "B") {
                if(rowCount[i] == 1 && colCount[j] == 1) {
                    lonelyCount += 1
                }
            }
        }
    }
    return lonelyCount
}

var pic = [["W","W","B"],["W","B","W"], ["B","W","W"]]

findLonelyPixels(picture: pic)