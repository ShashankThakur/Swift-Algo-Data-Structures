//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func solveMaze(_ maze:[[Int]]) {
    let size = maze.count
    var sol = Array(repeating: Array(repeating: 0, count: size), count: size)
    if(solveMazeUtil(maze, 0, 0, &sol, size)) {
        print("SOlution exist")
        print(sol)
    }
    else {
        print("No solution exist")
    }
}

func solveMazeUtil(_ maze:[[Int]],_ x:Int, _ y:Int, _ sol: inout [[Int]], _ size:Int) -> Bool{
    if(x == size - 1 && y == size - 1 ) {
        sol[x][y] = 1
        return true
    }
    //check if maze is valid
    if(isSafe(maze,x,y,size)){
        sol[x][y] = 1
        
        //move forward in X direction
        if(solveMazeUtil(maze, x + 1, y, &sol, size)) {
            return true
        }
        
        //move forward in Y direction
        if(solveMazeUtil(maze, x, y + 1, &sol, size)) {
            return true
        }
        
        /*If none of the above movements works then
         BACKTRACK: unmark x,y as part of solution
         path */
        
        sol[x][y] = 0
        return false
    }
    return false
}

func isSafe(_ maze:[[Int]], _ x:Int, _ y:Int, _ size:Int) ->Bool{
    if (x >= 0 && x < size && y >= 0 && y < size && maze[x][y] == 1) {
        return true
    }
    return false
}
let entry = [[1,0,0,0],
             [1,1,0,1],
             [0,1,0,0],
             [1,1,1,1]]

solveMaze(entry)
