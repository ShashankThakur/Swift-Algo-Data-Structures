//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func binarySearch(_ num:[Int],_ key:Int) ->Int?{
    var low = 0
    var high = num.count
    var middle = 0
    while (low < high) {
        middle = (low + high)/2
        if(num[middle] < key) {
            low = middle + 1
        }
        else if(num[middle] > key) {
            high = middle
        }
        else {
            return middle
        }
    }
    return nil
}
