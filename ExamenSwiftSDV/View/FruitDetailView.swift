import SwiftUI

struct FruitDetailView: View {
    let fruit: Fruit
    @State private var showNutrition = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack {
                    LinearGradient(
                        colors: fruit.gradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )

                    Image(fruit.image)
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                        .padding(.horizontal, 40)
                }
                .frame(height: UIScreen.main.bounds.height / 3)

                VStack(alignment: .leading, spacing: 20) {
                    Text(fruit.title)
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(fruit.gradientColors[1])
                        .padding(.top, 20)

                    Text(fruit.headline)
                        .font(.headline)
                        .fontWeight(.bold)

                    DisclosureGroup(isExpanded: $showNutrition) {
                        VStack(spacing: 12) {
                            nutritionRow("Energy", fruit.nutrition[0])
                            nutritionRow("Sugar", fruit.nutrition[1])
                            nutritionRow("Fat", fruit.nutrition[2])
                            nutritionRow("Protein", fruit.nutrition[3])
                            nutritionRow("Vitamins", fruit.nutrition[4])
                            nutritionRow("Minerals", fruit.nutrition[5])
                        }
                        .padding(.top, 10)
                    } label: {
                        Text("Nutritional value per 100g")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(fruit.gradientColors[1].opacity(0.5), lineWidth: 2)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                            )
                    )

                    Text("LEARN MORE ABOUT \(fruit.title.uppercased())")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(fruit.gradientColors[1])
                        .padding(.top, 10)

                    Text(fruit.description)
                        .font(.body)
                        .lineSpacing(5)

                    Spacer(minLength: 30)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func nutritionRow(_ label: String, _ value: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "info.circle")
                .foregroundColor(fruit.gradientColors[1])

            Text(label)
                .fontWeight(.semibold)
                .foregroundColor(fruit.gradientColors[1])

            Spacer()

            Text(value)
        }
    }
}

#Preview {
    NavigationStack {
        FruitDetailView(fruit: Fruit(
            title: "Apple",
            headline: "Apples are one of the most popular, and exceptionally healthy fruit for good reason.",
            image: "apple",
            gradientColors: [Color.red, Color.orange],
            description: "An apple is a sweet, edible fruit produced by an apple tree.",
            nutrition: ["218 kJ (52 kcal)", "10.39 g", "0.17 g", "0.26 g", "A, B1, B2, B3, B5, B6, B9, C, E, K", "Calcium, Iron, Magnasium"]
        ))
    }
}
