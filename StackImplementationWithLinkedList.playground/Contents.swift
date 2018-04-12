//: Playground - noun: a place where people can play

//This is stack implementation based of linkedList

import UIKit

var str = "Hello, playground"


class Node <T> {
    var value:T
    var next:Node?
    init(value:T) {
        self.value = value
    }
}

class Stack <T> {
    private var top:Node<T>?
    public var count:Int = 0
    public func push(value:T) {
        let newNode = Node(value:value)
        newNode.next = top
        top = newNode
        
        count += 1
    }
    
    public func peek() ->Node<T>? {
        return top
    }
    
    public func pop() ->Node<T>?{
        if let node = top {
            top = top?.next
            count -= 1
            return node
        }
        return nil
    }
}

var stack = Stack<String>()
stack.push(value: "test1")
stack.push(value: "test2")
stack.push(value: "test3")
stack.push(value: "test4")
stack.push(value: "test5")

stack.pop()?.value
stack.pop()?.value
stack.pop()?.value

