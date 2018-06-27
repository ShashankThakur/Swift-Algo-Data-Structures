//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class BinaryNode<T:Comparable> {
    public var left:BinaryNode?
    public var right:BinaryNode?
    public var val:T
    public init(val:T){
        self.val = val
    }
    static public func == (lhs:BinaryNode<T>,rhs:BinaryNode<T>) ->Bool{
        return lhs.val == rhs.val
    }
}


//Complexity - O(h). h is height of tree
func LCA<T>(_ root:BinaryNode<T>?,_ n1:BinaryNode<T>, _ n2: BinaryNode<T>) ->BinaryNode<T>? {
    if(root == nil) {
        return nil
    }
    if(root!.val > max(n1.val, n2.val)) {
        return LCA(root?.left, n1, n2)
    }
    else if(root!.val < min(n1.val, n2.val)) {
        return LCA(root!.right, n1, n2)
    }
    else {
        return root
    }
}

