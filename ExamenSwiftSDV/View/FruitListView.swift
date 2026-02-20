import SwiftUI

struct FruitListView: View {
    @StateObject private var viewModel = FruitViewModel()
    @State private var showSettings = false

    var body: some View {
        List {
            ForEach(viewModel.fruits) { fruit in
                NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                    FruitRowView(fruit: fruit)
                }
                .listRowInsets(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Fruits")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showSettings = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.green)
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

#Preview {
    NavigationStack {
        FruitListView()
    }
}
