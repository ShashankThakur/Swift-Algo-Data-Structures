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
    public var count:Int = 0
    public var isEmpty:Bool {
        return head == nil
    }
    public func append(value:T){
        let newNode = Node(value: value)
        if let tail = getTail() {
            tail.next = newNode
        }else {
            head = newNode
        }
        count += 1
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
    func getTail() -> Node<T>? {
        if var node = head {
            while (node.next != nil) {
                node = node.next!
            }
            return node
        }
        return nil
    }
    public func description(){
        print()
        if var node = head{
            print(node.value,terminator:"")
            while(node.next != nil) {
                print("->",terminator:"")
                node = node.next!
                print(node.value,terminator:"")
            }
        }
    }
    public func deleteNode(value:T){
        var prev:Node<T>?
        var node = head
        if(node != nil && node?.value == value) {
            head = node!.next
            return
        }
        while (node != nil && node?.value != value) {
            prev = node
            node = node!.next
        }
        
        if(node == nil) {
            return
        }
        prev?.next = node?.next
        
    }
    
    
}

var linkList = LinkedList<String>()
linkList.append(value: "test1")
linkList.append(value: "test2")
linkList.append(value: "test3")
linkList.append(value: "test4")


linkList.description()

linkList.deleteNode(value: "test1")
linkList.deleteNode(value: "test3")
linkList.deleteNode(value: "test2")
linkList.deleteNode(value: "test4")


linkList.description()


linkList.insertNodeAtFront(value: "test10")

linkList.description()
