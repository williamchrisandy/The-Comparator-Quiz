//
//  BlueButtonStyle.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 23/04/22.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle
{
    var disabled: Bool
    func makeBody(configuration: Configuration) -> some View
    {
        configuration.label
            .padding()
            .background(disabled == true ? Color("CustomBlue").opacity(0.3) : Color("CustomBlue"))
            .foregroundColor(disabled == true ? .white : Color("CustomBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .disabled(disabled)
    }
}

struct BlueButtonStyle_Previews: PreviewProvider
{
    static var previews: some View
    {
        Button("Button Demo")
        {
            print("Button pressed!")
        }
        .buttonStyle(BlueButtonStyle(disabled: false))
    }
}
