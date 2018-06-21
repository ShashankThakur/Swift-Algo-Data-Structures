//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*Given a binary search tree and the lowest and highest boundaries as L and R, trim the tree so that all its elements lies in [L, R] (R >= L). You might need to change the root of the tree, so the result should return the new root of the trimmed binary search tree.

Example 1:
Input:
1
/ \
0   2

L = 1
R = 2

Output:
1
\
2
 
*/


//Complexity - O(n)
class Solution {
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        if (root == nil) {
            return nil
        }
        if(root!.val < L) {
            return trimBST(root!.right,L,R)
        }
        if(root!.val > R) {
            return trimBST(root!.left,L,R)
        }
        root!.left = trimBST(root!.left,L,R)
        root!.right = trimBST(root!.right,L,R)
        return root
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


