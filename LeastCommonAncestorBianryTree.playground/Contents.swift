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

//Complexity - O(n)

func LCA<T>(_ root:BinaryNode<T>?,_ n1:BinaryNode<T>, _ n2: BinaryNode<T>) ->BinaryNode<T>? {
    if(root == nil) {
        return nil
    }
    if(root! == n1 || root! == n2) {
        return root
    }
    let left = LCA(root!.left, n1, n2)
    let right = LCA(root!.right, n1, n2)
    if(left != nil && right != nil) {
        return root
    }
    if(left == nil && right == nil) {
        return nil
    }
    return left != nil ? left:right
}

