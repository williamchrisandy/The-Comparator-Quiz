import SwiftUI

@main
struct MyApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .background(
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .opacity(0.8)
                )
        }
    }
}
