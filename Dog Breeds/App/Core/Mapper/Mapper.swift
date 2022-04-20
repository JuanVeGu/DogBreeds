//
//  Mapper.swift
//  Dog Breeds
//
//  Created by mobdev on 19-04-22.
//

import Foundation

class Mapper<T1, T2> {
    func map(value _: T1) -> T2 {
        fatalError("Not implemented")
    }
    
    func reverseMap(value _: T2) -> T1 {
        fatalError("Must override")
    }
    
    func map(values: [T1]) -> [T2] {
        var newValues = [T2]()
        values.forEach { value in
            newValues.append(map(value: value))
        }
        return newValues
    }
    
    func reverseMap(values: [T2]) -> [T1] {
        var newValues = [T1]()
        values.forEach { value in
            newValues.append(reverseMap(value: value))
        }
        return newValues
    }
}
