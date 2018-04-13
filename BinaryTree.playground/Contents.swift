//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
