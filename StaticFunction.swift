//
//  StaticFunction.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import Foundation

class StaticFunction
{
    static func intArrayToString(from array : [Int]) -> String
    {
        var result = ""
        
        for index in array
        {
            if result.count != 0
            {
                result += ", "
            }
            result += String(index)
        }
            
        return result
    }
}
