//
//  Question.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 23/04/22.
//

import Foundation

class Question: Identifiable
{
    var id: Int = 0
    var comparedElements: [Int]
    var answerChoices: [String] = []
    var correctAnswerIndex: Int
    var meaning: [String]
    
    init(id: Int, comparedElements: [Int], meaning: [String])
    {
        self.id = id
        self.comparedElements = comparedElements
        self.meaning = meaning
        self.correctAnswerIndex = Int.random(in: 0...3)
        self.answerChoices = generateAnswerChoices()
    }
    
    func correctIndexSequences() -> [Int]
    {
        struct IntWithIndex
        {
            var index: Int
            var value: Int
        }
        
        var result: [Int] = []
        var tempArray : [IntWithIndex] = []
        for index in 0..<comparedElements.count
        {
            tempArray.append(IntWithIndex(index: index, value: comparedElements[index]))
        }
        
        tempArray = tempArray.sorted(by: {$0.value >= $1.value})
        
        for intWithIndex in tempArray
        {
            result.append(intWithIndex.index)
        }
        
        return result
    }
    
    func generateAnswerString(from array : [Int]) -> String
    {
        var result = ""
        
        for index in array
        {
            if result.count != 0
            {
                result += ", "
            }
            result += String(index+1)
        }
            
        return result
    }
    
    private func generateAnswerChoices() -> [String]
    {
        var result : [String] = []
        let correctIndexSequences = correctIndexSequences()
        for index in 0...3
        {
            var indexSequences = correctIndexSequences
            if index != correctAnswerIndex
            {
                var valid = false
                while valid == false
                {
                    indexSequences = Array(0..<comparedElements.count).shuffled()
                    
                    for i in 0..<comparedElements.count
                    {
                        if indexSequences[i] != correctIndexSequences[i]
                        {
                            valid = true
                            break
                        }
                        else if i == comparedElements.count
                        {
                            break
                        }
                    }
                }
            }
            result.append(generateAnswerString(from: indexSequences))
        }
        
        return result
    }
}
