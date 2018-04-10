//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class BinaryTree{
    var parent:BinaryTree?
    var left:BinaryTree?
    var right:BinaryTree?
    var value:Int
    public init(value:Int)
    {
        self.value = value
    }
    public var isLeaf:Bool{
        return left == nil && right == nil
    }
}

func longestConsecutiveUtil(root:BinaryTree?,var path:[Int], inout result:[[Int]])
{
    if root == nil{
        return
    }
    let node = root!
    if (node.isLeaf){
        if((node.value - path.last!) == 1)
        {
            path.append(node.value)
            result.append(path)
        }
    }
    else
    {
        if(path.count == 0 || (node.value - path.last! == 1))
        {
            path.append(node.value)
        }
        else
        {
            result.append(path)
            path.removeAll()
            path.append(node.value)
        }
    }
    longestConsecutiveUtil(node.left, path: path, result: &result)
    longestConsecutiveUtil(node.right, path: path, result: &result)

}

func longestConsecutiveSequence(root:BinaryTree) ->[Int]
{
    let path = [Int]()
    var result = [[Int]]()
    longestConsecutiveUtil(root, path: path, result: &result)
    return result.sort{$0.count > $1.count}.first!
}

var bTreeA = BinaryTree(value:1)
var bTreeB = BinaryTree(value:2)
var bTreeC = BinaryTree(value:3)
var bTreeD = BinaryTree(value:2)

bTreeB.right = bTreeC
bTreeC.left = bTreeD
bTreeD.left = bTreeA

longestConsecutiveSequence(bTreeB)

