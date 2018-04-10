//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public struct Stack<T>{
    var elements = [T]()
    public mutating func push(value:T)
    {
        elements.append(value)
    }
    public mutating func pop() ->T?
    {
        if elements.isEmpty
        {
            return nil
        }
        return elements.removeLast()
    }
    public func peek() ->T?
    {
        return elements.last
    }
}


public class Edge<T:Hashable>:Equatable{
    public var neighbor:Node<T>
    public var weight:Int
    public init(neighbor:Node<T>,weight:Int){
        self.neighbor = neighbor
        self.weight = weight
    }
}

public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    return lhs.neighbor == rhs.neighbor
}

public class Node<T:Hashable>:Equatable,Hashable{
    public var neighbors:[Edge<T>]
    public private (set) var label:T
    public var visited:Bool
    public var distance:Int?
    public var index:Int?
    public init(label:T)
    {
        self.label = label
        neighbors = []
        self.visited = false
    }
    
    public var hashValue: Int{
        return label.hashValue
    }
}

public func == <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs.label == rhs.label && lhs.neighbors == rhs.neighbors
}

public class Graph<T:Hashable>:Equatable{
    public private (set) var nodes:[Node<T>]
    private var count = 0
    public init(){
        nodes = []
    }
    
    public func addNode(label:T) ->Node<T>{
        
        let newNode = Node<T>(label: label)
        newNode.index = count
        nodes.append(newNode)
        count++
        return newNode
    }
    
    public func addEdge(source:Node<T>,neighbor:Node<T>,weight:Int){
        let edge = Edge<T>(neighbor:neighbor,weight: weight)
        source.neighbors.append(edge)
    }
}

public func == <T>(lhs: Graph<T>, rhs: Graph<T>) -> Bool {
    return lhs.nodes == rhs.nodes
}

public func topologicalSort<T>(graph:Graph<T>)
{
    var stack = Stack<Node<T>>()
    var visitedSet = Set<Node<T>>()
    
    for node in graph.nodes
    {
        if(!visitedSet.contains(node))
        {
            topSortUtil(&visitedSet, vertex: node, stack: &stack)
        }
    }
    
    var dist = Array(count:graph.nodes.count,repeatedValue:Int.max)
    dist[0] = 0
    
    
    while stack.peek() != nil
    {
        let node = stack.pop()!
        for edge in node.neighbors
        {
            if(dist[edge.neighbor.index!] > dist[node.index!] + edge.weight)
            {
                dist[edge.neighbor.index!] = dist[node.index!] + edge.weight
            }
        }
        
        //print(node.label)
    }
    for var i = 0; i < graph.nodes.count; i++
    {
        print(dist[i])
    }
}
func topSortUtil<T>(inout visited:Set<Node<T>>,vertex:Node<T>,inout stack:Stack<Node<T>>)
{
    visited.insert(vertex)
    for edge in vertex.neighbors
    {
        if(!visited.contains(edge.neighbor))
        {
            topSortUtil(&visited, vertex: edge.neighbor, stack: &stack)
        }
    }
    stack.push(vertex)
}

var graph = Graph<String>()
let nodeS = graph.addNode("S")
let nodeT = graph.addNode("T")
let nodeV = graph.addNode("V")
let nodeW = graph.addNode("W")
let nodeX = graph.addNode("X")

graph.addEdge(nodeS, neighbor: nodeV,weight: 2)
graph.addEdge(nodeS, neighbor: nodeW,weight: 3)

graph.addEdge(nodeV, neighbor: nodeT,weight: -2)
graph.addEdge(nodeW, neighbor: nodeT,weight: 1)

graph.addEdge(nodeT, neighbor: nodeX,weight: 4)

topologicalSort(graph)





