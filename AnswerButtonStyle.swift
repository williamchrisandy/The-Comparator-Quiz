//
//  AnswerButtonStyle.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import SwiftUI

struct AnswerButtonStyle: ButtonStyle
{
    var selected: Bool
    func makeBody(configuration: Configuration) -> some View
    {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white.opacity(selected == true ? 0.9 : 0.6))
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

struct AnswerButtonStyle_Previews: PreviewProvider
{
    static var previews: some View
    {
        Button("Button Demo")
        {
            print("Button pressed!")
        }
        .buttonStyle(AnswerButtonStyle(selected: true))
    }
}
