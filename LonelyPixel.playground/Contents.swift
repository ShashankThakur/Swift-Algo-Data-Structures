//: Playground - noun: a place where people can play

import UIKit

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