//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*A circus is designing a tower routine consisting of people standing atop one another's shoulders.For practical and aesthetic reasons, each person must be both shorter and lighter than the person below him or her. Given the heights and weights of each person in the circus, write a method to compute the largest possible number of people in such a tower.
EXAMPLE:
Input (ht,wt): (65, 100) (70, 150) (56, 90) (75, 190) (60, 95) (68, 110)
Output:The longest tower is length 6 and includes from top to bottom:
(56, 90) (60,95) (65,100) (68,110) (70,150) (75,190)
 */

struct Human {
    var height:Int
    var weight:Int
}
func getLongestTower(_ list:[Human]) ->Int {
    if(list.isEmpty) {return 0}
    if(list.count == 1) {return 1}
    var input = list
    
    //get input sorted
    input = input.sorted{
        (h1:Human, h2:Human) in input
        return h1.height < h2.height
    }
    
    let result = longestInceasingSequence(input)
    return result.max()!
}
func longestInceasingSequence(_ list:[Human]) ->[Int] {
    let n = list.count
    var result = Array(repeating: 1, count: n)
    var j = 0, i = 1
    for i in 1..<n {
        if(list[j].weight < list[i].weight) {
            result[i] = result[j] + 1
        }
        j += 1
    }
    return result
}

var humanList = [Human]()
humanList.append(Human(height: 65, weight: 100))
humanList.append(Human(height: 70, weight: 150))
humanList.append(Human(height: 68, weight: 110))
humanList.append(Human(height: 60, weight: 95))
humanList.append(Human(height: 75, weight: 190))
humanList.append(Human(height: 56, weight: 90))

getLongestTower(humanList)



