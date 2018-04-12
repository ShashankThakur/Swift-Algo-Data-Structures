//: Playground - noun: a place where people can play

//This is generic implemtation of queue based of linked list
import UIKit

var str = "Hello, playground"


class Node<T> {
    var value:T
    var next:Node?
    init(value:T) {
        self.value = value
    }
}

class Queue<T> {
    var tail:Node<T>?
    var head:Node<T>?
    var count:Int = 0
    func dequeue () ->Node<T>?{
        if let node = head {
            head = head?.next
            count -= 1
            return node
        }
        return nil
    }
    
    func enqueue(value:T) {
        let newNode = Node(value:value)
        if (head == nil) {
            tail = newNode
            head = tail
        }
        else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
}


var queue = Queue<String>()
queue.enqueue(value: "test1")
queue.enqueue(value: "test2")
queue.enqueue(value: "test3")
queue.enqueue(value: "test4")
queue.enqueue(value: "test5")


queue.dequeue()?.value
queue.dequeue()?.value
queue.dequeue()?.value


    