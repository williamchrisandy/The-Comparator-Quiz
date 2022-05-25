//
//  OnBoardingView.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import SwiftUI

struct OnBoardingView: View
{
    @Binding var viewType: String
    var body: some View
    {
        VStack
        {
            Text("The Comparator Quiz")
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
            ScrollView
            {
                VStack(alignment: .leading)
                {
                    Text("Welcome to The Comparator Quiz!")
                        .padding(.vertical)
                    Text("This quiz will provide you with some questions that will be challenging to answer.")
                        .padding(.bottom, 8)
                    Text("Each question has its own meaning and will be explained along with the correct answer (result).")
                    Text("Good Luck!!!")
                        .padding(.vertical)
                }
                .font(.title2)
            }
            HStack
            {
                Spacer()
                Button
                {
                    viewType = "QuestionView"
                }
                label:
                {
                    Label("Next", systemImage: "arrow.right")
                        .font(.title2)
                }
                .buttonStyle(BlueButtonStyle(disabled: false))
                .disabled(false)
            }
            .padding(.vertical)
        }
        .padding()
    }
}

struct OnBoardingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ForEach(["iPad Pro (9.7-inch)", "iPad Pro (12.9-inch) (5th generation)", "iPhone 13 Pro Max", "iPhone SE (1st generation)"], id: \.self)
        {
            deviceName in
            OnBoardingView(viewType: .constant("OnBoardingView"))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .previewInterfaceOrientation(.portrait)
    }
}
