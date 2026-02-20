import SwiftUI

@main
struct ExamenSwiftSDVApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ContentView()
            } else {
                NavigationStack {
                    FruitListView()
                }
            }
        }
    }
}
