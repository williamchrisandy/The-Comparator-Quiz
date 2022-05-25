//
//  QuestionView.swift
//  The Comparator Quiz
//
//  Created by William Chrisandy on 23/04/22.
//

import SwiftUI

struct QuestionView: View
{
    @Binding var index: Int
    @Binding var viewType: String
    @Binding var sessionResult: Int
    @State private var selectedAnswer = -1
    
    private var chart: [HorizontalBar]
    {
        var i = 1;
        var result: [HorizontalBar] = []
        for element in questionsData[index].comparedElements
        {
            result.append(HorizontalBar(id: i, width: element))
            i += 1
        }
        return result
    }
    
    private var answers: [AnswerButton]
    {
        var i = 0;
        var result: [AnswerButton] = []
        for answer in questionsData[index].answerChoices
        {
            result.append(AnswerButton(id: i, selectedAnswer: $selectedAnswer, text: answer))
            i += 1
        }
        return result
    }
    
    var body: some View
    {
        VStack
        {
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 36.0, height: 36.0)
                .padding(.all, 8.0)
            Text("Question \(index+1) of \(questionsData.count)")
                .font(.title)
                .padding(.bottom, 16.0)
            ScrollView
            {
                VStack(alignment: .leading)
                {
                    Text("Select the sequence of the following objects so they will be sorted from the longest to the shortest!")
                        .font(.title2)
                    ForEach(chart)
                    {
                        bar in
                        HStack
                        {
                            Text("(\(bar.id))")
                                .font(.title3)
                                .frame(width: 36.0)
                            bar.frame(width: CGFloat(bar.width), height: 50, alignment: .leading)
                            Spacer()
                        }
                    }
                    Text("Select Answer:")
                        .font(.title2)
                        .padding(.top)
                    ForEach(answers)
                    {
                        answer in
                        answer
                    }
                    AnswerButton(id: 4, selectedAnswer: $selectedAnswer, text: "All bar is equals")
                }
            }
            HStack
            {
                Spacer()
                Button
                {
                    viewType = "ResultView"
                    sessionResult = selectedAnswer == 4 ? 0 : (selectedAnswer == questionsData[index].correctAnswerIndex ? 1 : -1)
                }
                label:
                {
                    Label("Next", systemImage: "arrow.right")
                        .font(.title2)
                }
                .buttonStyle(BlueButtonStyle(disabled: selectedAnswer == -1))
                .disabled(selectedAnswer == -1)
            }
            .padding(.vertical)
        }
        .padding()
    }
}

struct QuestionView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ForEach(["iPad Pro (9.7-inch)", "iPad Pro (12.9-inch) (5th generation)", "iPhone 13 Pro Max", "iPhone SE (1st generation)"], id: \.self)
        {
            deviceName in
            QuestionView(index: .constant(3), viewType: .constant("QuestionView"), sessionResult: .constant(-1))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .previewInterfaceOrientation(.portrait)
    }
}
