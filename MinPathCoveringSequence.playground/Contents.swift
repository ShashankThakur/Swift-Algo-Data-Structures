import UIKit

/*
 Reference - daily coding problem
 You are in an infinite 2D grid where you can move in any of the 8 directions:
 
 (x,y) to
 (x+1, y),
 (x - 1, y),
 (x, y+1),
 (x, y-1),
 (x-1, y-1),
 (x+1,y+1),
 (x-1,y+1),
 (x+1,y-1)
 You are given a sequence of points and the order in which you need to cover the points. Give the minimum number of steps in which you can achieve it. You start from the first point.
 
 Example:
 
 Input: [(0, 0), (1, 1), (1, 2)]
 Output: 2
 It takes 1 step to move from (0, 0) to (1, 1). It takes one more step to move from (1, 1) to (1, 2).
 */
typealias point = (x:Int,y:Int)

func coverPoins(_ points:[point]) -> Int {
    var steps = 0
    if points.count == 0 {
        return steps
    }
    for i in 0..<points.count - 1 {
        steps = steps + diffBetweenTwoPoints(points[i], points[i + 1])
    }
    return steps
}

func diffBetweenTwoPoints(_ p1:point, _ p2:point) ->Int{
    let diffX = abs(p1.x - p2.x)
    let diffY = abs(p1.y - p2.y)
    return max(diffX, diffY)
}

coverPoins([(0, 0), (1, 1), (1, 2)])

