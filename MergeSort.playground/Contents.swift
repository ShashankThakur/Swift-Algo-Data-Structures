//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func mergeSort(input:inout [Int],low:Int, high:Int) {
    guard input.count > 1 else { return  }
    if(low < high) {
        let middle = (low + high)/2
        mergeSort(input: &input, low: low, high: middle)
        mergeSort(input: &input, low: middle + 1, high: high)
        merge(array:&input, startIndex: low, middleIndex: middle, endIndex: high)

    }
}

func merge(array: inout [Int],startIndex:Int, middleIndex:Int, endIndex:Int) {
    let leftSubarray = Array(array[startIndex...middleIndex])
    let rightSubarray = Array(array[middleIndex+1...endIndex])
    
    var index = startIndex
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
        if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
            array[index] = leftSubarray[leftIndex]
            leftIndex += 1
        }
        else {
            array[index] = rightSubarray[rightIndex]
            rightIndex += 1
        }
        index += 1
    }
    
    while leftIndex < leftSubarray.count {
        array[index] = leftSubarray[leftIndex]
        index += 1
        leftIndex += 1
    }
    
    while rightIndex < rightSubarray.count {
        array[index] = rightSubarray[rightIndex]
        index += 1
        rightIndex += 1
    }
}
var a = [10, 2, 9, 1,3]
mergeSort(input: &a, low: 0, high: a.count - 1)
