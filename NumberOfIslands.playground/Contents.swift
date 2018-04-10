//: Playground - noun: a place where people can play

import UIKit

/*Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.*/

public struct UnionFind<T:Hashable>{
    var map = [T:Int]()
    var parent = [Int]()
    var rank = [Int]()
    var counts = 0
    
    
    public mutating func addSet(element:T)
    {
        map[element] = parent.count
        parent.append(parent.count)
        rank.append(1)
        counts++
    }
    
    public mutating func findSet(element:T) ->Int?
    {
        if let index = map[element]{
            return getSetByIndex(index)
        }
        return nil
    }
    
    private mutating func getSetByIndex(index:Int) ->Int
    {
        if parent[index] == index
        {
            return index
        }
        else
        {
            parent[index] = getSetByIndex(parent[index])
            return parent[index]
        }
    }
    
    public mutating func unionSetsContaining(firstElement: T, and secondElement: T) {
        if let firstSet = findSet(firstElement), secondSet = findSet(secondElement)
        {
            if firstSet != secondSet {
                if rank[firstSet] < rank[secondSet] {
                    parent[firstSet] = secondSet
                    rank[secondSet] += rank[firstSet]
                } else {
                    parent[secondSet] = firstSet
                    rank[firstSet] += rank[secondSet]
                }
                counts--
            }
            
        }
    }
    
}

public func findNumberOfIslands(a:[[Int]]) ->Int{
    var vertices = Set<Int>()
    var edges = [(source:Int,destination:Int)]()
    if (a.count == 0 || a[0].count < 0)
    {
        return 0
    }
    for (var i = 0; i < a.count; i++)
    {
        for (var j = 0; j < a[i].count; j++)
        {
            if(a[i][j] == 1)
            {
                let edge = (i,j)
                edges.append(edge)
                vertices.insert(i)
                vertices.insert(j)
            }
        }
    }
    var unionFind = UnionFind<Int>()
    for vertex in vertices {
        unionFind.addSet(vertex)
    }
    for edge in edges
    {
        if(unionFind.findSet(edge.source) != unionFind.findSet(edge.destination))
        {
            
            unionFind.unionSetsContaining(edge.source, and: edge.destination)
        }
    }
    return unionFind.counts
}

var testInput = [
    [1,1,0,0,0],
    [1,1,0,0,0],
    [0,0,1,0,0],
    [0,0,0,1,1]
]

findNumberOfIslands(testInput)