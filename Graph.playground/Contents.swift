//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node<T:Equatable> {
    var value:T
    var next:Node?
    init(value:T) {
        self.value = value
    }
}
class LinkedList<T:Equatable> {
    private var head:Node<T>?
    public var isEmpty:Bool {
        return head == nil
    }
    
    
    public func insertNodeAtFront(value:T){
        let newNode = Node(value: value)
        if let node = head {
            head = newNode
            newNode.next = node
        }else {
            head = newNode
        }
    }
}

class GraphNode<T:Hashable>{
    var neighbors:[T:LinkedList<T>]
    init() {
        self.neighbors = [T:LinkedList<T>]()
    }
    
}
class Graph<T:Hashable>{
    var vertices:Array<GraphNode<T>>
    init(){
        self.vertices = Array<GraphNode<T>>()
    }
}
