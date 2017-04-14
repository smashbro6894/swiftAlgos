//: Playground - noun: a place where people can play

import UIKit
import Foundation


var myArray = [5,4,2,2,4,7,9,43,1,2,5,7,6,4,23,2,4,5,87,7,5,4,2,34,4,6,1111]
func radixSort(_ array: inout [Int] ){
    let radix = 10  //Here we define our radix to be 10
    var done = false
    var index: Int
    var digit = 1  //Which digit are we on?
    
    
    while !done {  //While our  sorting is not completed
        done = true  //Assume it is done for now
        
        var buckets: [[Int]] = []  //Our sorting subroutine is bucket sort, so let us predefine our buckets
        
        for _ in 1...radix {
            buckets.append([])
        }
        
        
        for number in array {
            index = number / digit  //Which bucket will we access?
            print("This is the index", index)
            buckets[index % radix].append(number)
            if done && index > 0 {  //If we arent done, continue to finish, otherwise we are done
                done = false
            }
        }
        
        var i = 0
        
        for j in 0..<radix {
            let bucket = buckets[j]
            print("This is the bucket", bucket, j)
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        
        digit *= radix  //Move to the next digit
        print(digit)
    }
    print(array)
}

radixSort(&myArray)