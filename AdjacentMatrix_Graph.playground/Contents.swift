//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public struct Edge<T:Equatable>{
    var neighbor:Node<T>
    var distance:Double?
//    init(neighbor:Node<T>){
//        self.neighbor = neighbor
//    }
}
public struct Node<T:Equatable>{
    var label:T
    var visited:Bool
    let index:Int
}


public class Graph<T:Equatable>{
    var vertices:[Node<T>]
    var matrix:[[Double?]] = []
    init()
    {
        self.vertices = []
    }
    func createVertex(label:T) ->Node<T>{
        
        let matchingVertices = vertices.filter() { vertex in
            return vertex.label == label
        }
        
        if matchingVertices.count > 0 {
            return matchingVertices.last!
        }
        
        let node = Node<T>(label: label, visited: false, index: matrix.count)
        
        
        for i in 0 ..< matrix.count {
            matrix[i].append(nil)
        }
        
        let newRow = [Double?](count: matrix.count + 1, repeatedValue: nil)
        matrix.append(newRow)
        
        
        vertices.append(node)
        return node

    }
    func connectVerticesWithWeight(source:Node<T>, destination:Node<T>,distance:Double){
        matrix[source.index][destination.index] = distance
    }
}


var graph = Graph<String>()
var vertexA = graph.createVertex("A")
var vertexB = graph.createVertex("B")
var vertexC = graph.createVertex("C")
var vertexD = graph.createVertex("D")
var vertexE = graph.createVertex("E")

//graph.matrix
graph.connectVerticesWithWeight(vertexA, destination: vertexB, distance: 5.6)
graph.connectVerticesWithWeight(vertexA, destination: vertexC, distance: 1)
graph.connectVerticesWithWeight(vertexA, destination: vertexD, distance: 4.2)
graph.connectVerticesWithWeight(vertexB, destination: vertexC, distance: 2.7)
graph.connectVerticesWithWeight(vertexC, destination: vertexA, distance:1)
graph.connectVerticesWithWeight(vertexC, destination: vertexA, distance:2.7)
graph.connectVerticesWithWeight(vertexE, destination: vertexB, distance:-3.0)


for var i = 0; i < graph.matrix.count; i++
{
    for var j = 0; j < graph.matrix[i].count; j++ {
        //print(graph.matrix[i][j])
    }
    //print("\n")
}
//graph.matrix

//
//func tester(){
//    var n = "name"
//    closureTes
//}


public class BinaryTree<T:Hashable>:Hashable{
    var left:BinaryTree?
    var right:BinaryTree?
    var parent:BinaryTree?
    var value:T
    init(value:T){
        self.value = value
    }
    public var hashValue:Int{
        let test = String(self.value) + String(left?.value) + String(right?.value)
        return test.hash
    }
}

public func == <T>(lhs:BinaryTree<T>,rhs:BinaryTree<T>) -> Bool{

    return  lhs.value == rhs.value && lhs.left == rhs.left && lhs.right == rhs.right
}

var t1 = BinaryTree<String>(value: "A")
t1.left = BinaryTree<String>(value: "B")
t1.right = BinaryTree<String>(value: "C")

var t2 = BinaryTree<String>(value: "A")
t2.left = BinaryTree<String>(value: "B")
t2.right = BinaryTree<String>(value: "C")


var t3 = BinaryTree<String>(value: "A")
t3.left = BinaryTree<String>(value: "B")
t3.right = BinaryTree<String>(value: "C")


var dict:[BinaryTree:Int] = [t1:1]
if(dict[t2] != nil)
{
    print("duplicate")
}






