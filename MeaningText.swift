//
//  MeaningText.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import SwiftUI

struct MeaningText: View, Identifiable
{
    var id: Int
    var text: String
    
    var body: some View
    {
        HStack
        {
            Text(text)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            Spacer()
        }
    }
}

struct MeaningText_Previews: PreviewProvider
{
    static var previews: some View
    {
        MeaningText(id: 0, text: "This is a meaning.")
    }
}
