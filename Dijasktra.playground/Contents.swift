//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class Edge<T:Equatable>{
    var neighbor:Node<T>
    var weight:Int
    public init(weight:Int,neighbor:Node<T>){
        self.neighbor = neighbor
        self.weight = weight
    }
}
public class Node<T:Equatable>{
    var edges:[Edge<T>]
    var label:T
    var visited:Bool
    public init(label:T){
        self.label = label
        self.edges = []
        self.visited = false
    }
}

public class Graph<T:Equatable>
{
    var nodes:[Node<T>]
    public init()
    {
        self.nodes = []
    }
    
    public func createVertex(label:T) ->Node<T>{
        let newNode = Node<T>(label: label)
        nodes.append(newNode)
        return newNode
    }
    
    public func addEdgeToVertexWithWeight(source:Node<T>,destination:Node<T>,weight:Int){
        let edge = Edge<T>(weight: weight, neighbor: destination)
        source.edges.append(edge)
    }
    
    public func indexOFNode(label:T) -> Int{
        var index:Int = 0
        for var i = 0; i < self.nodes.count; i++ {
            if (self.nodes[i].label == label)
            {
                index  = i
                break
            }
        }
        return index
        
    }
}

var graph = Graph<String>()
var nodeA = graph.createVertex("A")
var nodeB = graph.createVertex("B")
var nodeC = graph.createVertex("C")
var nodeD = graph.createVertex("D")
var nodeE = graph.createVertex("E")

graph.addEdgeToVertexWithWeight(nodeA, destination: nodeB, weight: 10)
graph.addEdgeToVertexWithWeight(nodeA, destination: nodeC, weight: 3)

graph.addEdgeToVertexWithWeight(nodeB, destination: nodeC, weight: 1)
graph.addEdgeToVertexWithWeight(nodeB, destination: nodeD, weight: 2)

graph.addEdgeToVertexWithWeight(nodeC, destination: nodeB, weight: 4)
graph.addEdgeToVertexWithWeight(nodeC, destination: nodeD, weight: 8)
graph.addEdgeToVertexWithWeight(nodeC, destination: nodeE, weight: 3)

graph.addEdgeToVertexWithWeight(nodeD, destination: nodeE, weight: 7)
graph.addEdgeToVertexWithWeight(nodeE, destination: nodeD, weight: 9)

public func dijasktra<T>(graph:Graph<String>,source:Node<T>){
    var dist = Array(count: graph.nodes.count, repeatedValue: Int.max)
    var spt = Array(count: graph.nodes.count, repeatedValue: false)
    
    dist[0] = 0
    
    for var i = 0; i < graph.nodes.count; i++ {
        let u = findMinDistance(dist, spt: spt)
        spt[u] = true
        for edge in graph.nodes[u].edges {
            if (dist[u] + edge.weight < dist[graph.indexOFNode(edge.neighbor.label)])
            {
                dist[graph.indexOFNode(edge.neighbor.label)] = dist[u] + edge.weight
            }
        }
    }
    printSOlution(dist, graph: graph)
}

public func findMinDistance(dist:[Int],spt:[Bool]) ->Int{
    var min = Int.max
    var min_index:Int = 0
    for var v = 0; v < dist.count; v++
    {
        if (spt[v] == false && dist[v] <= min)
        {
            min = dist[v]
            min_index = v
        }
    }
    return min_index
}


func printSOlution<T>(dist:[Int],graph:Graph<T>){
    for var d = 0; d < dist.count; d++
    {
        print(" vertex \(graph.nodes[d]) and distance from source  \(dist[d])")
    }
}

dijasktra(graph, source: nodeA)

