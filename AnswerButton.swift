//
//  AnswerButton.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import SwiftUI

struct AnswerButton: View, Identifiable
{
    var id: Int
    @Binding var selectedAnswer: Int
    var text: String
    
    var body: some View
    {
        Button
        {
            selectedAnswer = id
        }
        label:
        {
            HStack
            {
                Text("\(String(UnicodeScalar(UInt8(65+id)))).    \(text)")
                Spacer()
            }
        }
        .buttonStyle(AnswerButtonStyle(selected: selectedAnswer == id))
    }
}

struct AnswerButton_Previews: PreviewProvider
{
    static var previews: some View
    {
        AnswerButton(id: 0, selectedAnswer: .constant(4), text: "1, 2, 3, 4, 5")
    }
}
