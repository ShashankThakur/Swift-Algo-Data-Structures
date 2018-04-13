//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Queue <T>{
    private var list:Array<T>
    init() {
        list = Array<T>()
    }
    public func enqueue(value:T) {
        list.append(value)
    }
    
    public func dequeue() ->T? {
        if list.isEmpty {
            return nil
        }
        else {
            return list.removeFirst()
        }
    }
}

class BinaryTree<T> {
    var left:BinaryTree?
    var right:BinaryTree?
    var value:T
    init(value:T) {
        self.value = value
    }
}

func inOrderTraversal(node:BinaryTree<Int>?){
    if node == nil {
        return
    }
    inOrderTraversal(node: node?.left)
    print(node!.value)
    inOrderTraversal(node: node?.right)
}

func preOrderTraversal(node:BinaryTree<Int>?) {
    if node == nil {
        return
    }
    print(node!.value)
    preOrderTraversal(node: node?.left)
    preOrderTraversal(node: node?.right)

}

func postOrderTraversal(node:BinaryTree<Int>?) {
    if node == nil {
        return
    }
    postOrderTraversal(node: node?.left)
    postOrderTraversal(node: node?.right)
    print(node!.value)
}

func levelOrderTraversal(inputNode:BinaryTree<Int>?){
    var node = inputNode
    if node == nil {
        return
    }
    let queue = Queue<BinaryTree<Int>>()
    while (node != nil) {
        print(node!.value)
        if let left = node?.left{
            queue.enqueue(value: left)
        }
        if let right = node?.right{
            queue.enqueue(value: right)
        }
        node = queue.dequeue()
    }
    
}



var root = BinaryTree<Int>(value:1)
var node2 = BinaryTree<Int>(value: 2)
var node3 = BinaryTree<Int>(value: 3)
var node4 = BinaryTree<Int>(value: 4)
var node5 = BinaryTree<Int>(value: 5)


root.left = node2
root.right = node3
root.left!.left = node4
root.left!.right = node5


//inOrderTraversal(node: root)

//preOrderTraversal(node: root)

//postOrderTraversal(node: root)

//levelOrderTraversal(inputNode: root)
