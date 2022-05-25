//
//  HorizontalBar.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import SwiftUI

struct HorizontalBar: View, Identifiable
{
    var id: Int
    var width: Int
    
    var body: some View
    {
        Path
        {
            path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            path.addLine(to: CGPoint(x: width, y: 50))
            path.addLine(to: CGPoint(x: 0, y: 50))
        }
        .fill(Color("CustomBlack"))
    }
}

struct HorizontalBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        HorizontalBar(id: 0, width: 240)
    }
}
