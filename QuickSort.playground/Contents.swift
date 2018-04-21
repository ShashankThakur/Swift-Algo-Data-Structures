//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array = [10, 80, 30, 90, 40 , 50, 70]

func quickSort(array:inout [Int],low:Int,high:Int) {
    if (low < high) {
        let pivot = partition(a: &array,low:low, high: high)
        quickSort(array: &array, low: low, high: pivot - 1)
        quickSort(array: &array, low: pivot + 1, high: high)
    }
}

func partition(a:inout [Int],low:Int, high:Int) ->Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    (a[i], a[high]) = (a[high], a[i])
    return i
}

quickSort(array: &array, low: 0, high: array.count - 1)