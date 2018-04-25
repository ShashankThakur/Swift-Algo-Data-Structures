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
    public init(neighbor:Node<T>){
        self.neighbor = neighbor
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
    public init(){
        nodes = []
    }
    
    public func addNode(label:T) ->Node<T>{
        
        let newNode = Node<T>(label: label)
        nodes.append(newNode)
        return newNode
    }
    
    public func addEdge(source:Node<T>,neighbor:Node<T>){
        let edge = Edge(neighbor: neighbor)
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
            topSortUtil(visited: &visitedSet, vertex: node, stack: &stack)
        }
    }
    while stack.peek() != nil
    {
        let node = stack.pop()
        print(node!.label)
    }
}
func topSortUtil<T>( visited:inout Set<Node<T>>,vertex:Node<T>, stack:inout Stack<Node<T>>)
{
    visited.insert(vertex)
    for edge in vertex.neighbors
    {
        if(!visited.contains(edge.neighbor))
        {
            topSortUtil(visited: &visited, vertex: edge.neighbor, stack: &stack)
        }
    }
    stack.push(value: vertex)
}

var graph = Graph<String>()
let nodeS = graph.addNode(label: "S")
let nodeT = graph.addNode(label: "T")
let nodeV = graph.addNode(label: "V")
let nodeW = graph.addNode(label: "W")
let nodeX = graph.addNode(label: "X")

graph.addEdge(source: nodeS, neighbor: nodeV)
graph.addEdge(source: nodeS, neighbor: nodeW)

graph.addEdge(source: nodeV, neighbor: nodeT)
graph.addEdge(source: nodeW, neighbor: nodeT)

graph.addEdge(source: nodeT, neighbor: nodeX)

topologicalSort(graph: graph)





