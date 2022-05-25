import SwiftUI

struct ContentView: View
{
    @State private var index: Int = 0
    @State private var viewType: String = "OnBoardingView"
    @State private var correct: Int = -1
    
    var body: some View
    {
        if viewType == "OnBoardingView"
        {
            OnBoardingView(viewType: $viewType)
        }
        if viewType == "QuestionView"
        {
            QuestionView(index: $index, viewType: $viewType, sessionResult: $correct)
        }
        else if viewType == "ResultView"
        {
            ResultView(index: $index, viewType: $viewType, sessionResult: $correct)
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ForEach(["iPad Pro (9.7-inch)", "iPad Pro (12.9-inch) (5th generation)", "iPhone 13 Pro Max", "iPhone SE (1st generation)"], id: \.self)
        {
            deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .previewInterfaceOrientation(.portrait)
    }
}
