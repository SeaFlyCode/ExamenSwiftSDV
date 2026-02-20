import SwiftUI

struct FruitRowView: View {
    let fruit: Fruit

    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: fruit.gradientColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .padding(8)
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    FruitRowView(fruit: Fruit(
        title: "Apple",
        headline: "Apples are one of the most popular, and exceptionally healthy fruit for good reason.",
        image: "apple",
        gradientColors: [.red, .orange],
        description: "A delicious fruit...",
        nutrition: ["100 kcal", "Vitamin C"]
    ))
    .previewLayout(.sizeThatFits)
    .padding()
}
