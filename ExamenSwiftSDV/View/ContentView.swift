import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FruitViewModel()
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some View {
        TabView {
            ForEach(viewModel.fruits) { fruit in
                ZStack {
                    LinearGradient(
                        colors: fruit.gradientColors,
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Spacer()

                        Image(fruit.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 280)
                            .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 10)
                            .padding(.horizontal, 40)

                        Text(fruit.title)
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                            .padding(.top, 20)

                        Text(fruit.headline)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .padding(.horizontal, 40)

                        Spacer()

                        Button(action: {
                            isOnboarding = false
                        }) {
                            HStack(spacing: 12) {
                                Text("Start")
                                    .font(.system(size: 22, weight: .bold))

                                Image(systemName: "arrow.right")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 18)
                            .background(
                                Capsule()
                                    .fill(Color.white.opacity(0.3))
                            )
                            .overlay(
                                Capsule()
                                    .strokeBorder(Color.white.opacity(0.5), lineWidth: 1)
                            )
                        }
                        .padding(.bottom, 60)
                    }
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    ContentView()
}
