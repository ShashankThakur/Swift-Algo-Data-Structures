//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node<T:Comparable>{
    var value:T
    var left:Node?
    var right:Node?
    init(value:T){
        self.value = value
    }
    func numberOfNode() -> Int {
        return (left?.numberOfNode() ?? 0)  + 1 + (right?.numberOfNode() ?? 0)
    }
    func heightOfTree() -> Int {
        return 1 + max(left?.heightOfTree() ?? 0,right?.heightOfTree() ?? 0)
    }
    
}

func insert<T>(node:Node<T>?, value:T) ->Node<T>{
    if (node == nil) {
        return Node(value: value)
    }
    if (value < node!.value){
        node!.left = insert(node: node!.left, value: value)
    }
    else if (value > node!.value) {
        node!.right = insert(node: node!.right, value: value)
    }
    return node!
}

func preOrderTraversal<T>(node:Node<T>?) {
    if node == nil {
        return
    }
    print(node!.value)
    preOrderTraversal(node: node?.left)
    preOrderTraversal(node: node?.right)
    
}

func postOrderTraversal<T>(node:Node<T>?) {
    if node == nil {
        return
    }
    postOrderTraversal(node: node?.left)
    postOrderTraversal(node: node?.right)
    print(node!.value)
}

func inOrderTraversal<T>(node:Node<T>?){
    if node == nil {
        return
    }
    inOrderTraversal(node: node?.left)
    print(node!.value)
    inOrderTraversal(node: node?.right)
}


func minNode<T>(inputNode:Node<T>?) -> Node<T>? {
    var node = inputNode
    if node == nil {
        return nil
    }
    if let left = node!.left {
        print(left.value)
        node = minNode(inputNode: left)
    }
    return node!
}

func searchNode<T>(inputNode:Node<T>?,value:T) ->Node<T>? {
    var node = inputNode
    if node == nil {
        return nil
    }
    if (value < node!.value) {
        node = searchNode(inputNode:node?.left, value: value)
    }
    else if (value > node!.value) {
        node = searchNode(inputNode:node?.right, value: value)
    }
    return node!
}

func checkIfBSTValid<T>(node:Node<T>?, minValue:T, maxValue:T) ->Bool {
    if(node == nil) {
        return false
    }
    if(node!.value < minValue || node!.value > maxValue) {
        return false
    }
    let isLeft = checkIfBSTValid(node: node!.left, minValue: minValue, maxValue: node!.value)
    let isRight = checkIfBSTValid(node: node!.right, minValue: node!.value  , maxValue: maxValue)
    
    return isLeft && isRight
}
//delete the node and returns new root
func deleteNode<T>(node:Node<T>?,value:T) ->Node<T>? {
    if (node == nil) {return nil}
    if (value < node!.value) {
        node!.left = deleteNode(node: node!.left, value: value)
    }
    else if (value > node!.value) {
        node!.right = deleteNode(node: node!.right, value: value)
    }
    else {
        //node with only 1 child or no child
        if(node!.left == nil) {
            let temp = node!.right
            node!.right = nil
            return temp
        }
        else if (node!.right == nil) {
            let temp = node!.left
            node!.left = nil
            return temp
        }
        
        //node with 2 children. Get inorder success or min value in right sub tree
        if let temp = minNode(inputNode: node!.right){
            node!.value = temp.value
            node!.right = deleteNode(node: node!.right, value: temp.value)
        }
    }
    return node
}


var root = Node<Int>(value:50)
insert(node: root, value: 30)
insert(node: root, value: 70)
insert(node: root, value: 60)
insert(node: root, value: 80)
insert(node: root, value: 20)
insert(node: root, value: 40)
insert(node: root, value: 25)
insert(node: root, value: 35)







