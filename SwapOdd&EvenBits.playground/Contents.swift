import UIKit

var str = "Hello, playground"




//Given an unsigned 8-bit integer, swap its even and odd bits. The 1st and 2nd bit should be swapped, the 3rd and 4th bit should be swapped, and so on.

func swapOddAndEvenBits(_ num:Int) ->Int {
    let oddBitsMasked = 0xAA
    let oddBits = (num & oddBitsMasked) >> 1
    
    let evenBitsMasked = 0x55
    let evenBits = (num & evenBitsMasked) << 1
    
    return oddBits | evenBits
}



swapOddAndEvenBits(23)
