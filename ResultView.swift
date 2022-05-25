//
//  ResultView.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 24/04/22.
//

import SwiftUI

struct ResultView: View
{
    @Binding var index: Int
    @Binding var viewType: String
    @Binding var sessionResult: Int
    
    private var meanings: [MeaningText]
    {
        var i = 0;
        var result: [MeaningText] = []
        for meaning in questionsData[index].meaning
        {
            result.append(MeaningText(id: i, text: meaning))
            i += 1
        }
        return result
    }
    
    var body: some View
    {
        VStack
        {
            Image(systemName: sessionResult == -1 ? "x.circle" : "checkmark.circle")
                .resizable()
                .foregroundColor(sessionResult == -1 ? .red : .green)
                .scaledToFill()
                .frame(width: 52.0, height: 52.0)
                .padding(.all, 8.0)
            Text(sessionResult == -1 ? "Incorrect" : "Correct")
                .foregroundColor(sessionResult == -1 ? .red : .green)
                .font(.largeTitle)
                .padding(.bottom, 16.0)
            ScrollView
            {
                VStack(alignment: .leading)
                {
                    Text("Select the sequence of the following objects so they will be sorted from the longest to the shortest!")
                        .padding(.vertical)
                        .font(.title2)
                    Text("\(StaticFunction.intArrayToString(from: questionsData[index].comparedElements))")
                        .font(.title)
                        .padding(.bottom, 4)
                    Text("Answer: \(questionsData[index].answerChoices[questionsData[index].correctAnswerIndex])")
                        .font(.title2)
                        .padding(.bottom)
                    if sessionResult == 0
                    {
                        Text("To be honest, you chose the wrong option, which is all bar is equal.")
                        Text("But, it is okay. The point of this quiz is to stop comparing the impossible. So, congratulations!!")
                    }
                    Text("Meaning:")
                        .font(.title2)
                        .padding(.vertical, 4)
                    ForEach(meanings)
                    {
                        meaning in
                        meaning
                    }
                }
            }
            HStack
            {
                Spacer()
                if index < questionsData.count - 1
                {
                    Button
                    {
                        index += 1
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
            }
            .padding(.vertical)
        }
        .padding()
    }
}

struct ResultView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ForEach(["iPad Pro (9.7-inch)", "iPad Pro (12.9-inch) (5th generation)", "iPhone 13 Pro Max", "iPhone SE (1st generation)"], id: \.self)
        {
            deviceName in
            ResultView(index: .constant(1), viewType: .constant("ResultView"), sessionResult: .constant(-1))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .previewInterfaceOrientation(.portrait)
    }
}
