//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

let adjacencyList = AdjacencyList<Int>()

let node0 = adjacencyList.createVertex(data: 0)
let node1 = adjacencyList.createVertex(data: 1)
let node2 = adjacencyList.createVertex(data: 2)
let node3 = adjacencyList.createVertex(data: 3)


adjacencyList.add(.directed, from: node0, to: node1, weight: nil)
adjacencyList.add(.directed, from: node0, to: node2, weight: nil)

adjacencyList.add(.directed, from: node1, to: node2, weight: nil)
adjacencyList.add(.directed, from: node2, to: node0, weight: nil)

adjacencyList.add(.directed, from: node2, to: node3, weight: nil)

adjacencyList.add(.directed, from: node3, to: node3, weight: nil)


adjacencyList.description


adjacencyList.breadthFirstSearch(source:node2)

adjacencyList.depthFirstSearch(source: node2)


