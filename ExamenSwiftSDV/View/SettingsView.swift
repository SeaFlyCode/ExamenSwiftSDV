import SwiftUI

struct SettingsView: View {
    @AppStorage("isOnboarding") private var isOnboarding = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    GroupBox {
                        Divider().padding(.vertical, 4)

                        HStack(alignment: .center, spacing: 16) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            colors: [.green, .green.opacity(0.7)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 80, height: 80)

                                Image(systemName: "leaf.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }
                            .shadow(radius: 4)

                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    } label: {
                        sectionLabel("info.circle", "FRUCTUS")
                    }

                    GroupBox {
                        Divider().padding(.vertical, 4)

                        VStack(alignment: .leading, spacing: 12) {
                            Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Toggle(isOn: $isOnboarding) {
                                Text("RESTART")
                                    .fontWeight(.bold)
                            }
                            .tint(.green)
                        }
                    } label: {
                        sectionLabel("paintbrush", "CUSTOMIZATION")
                    }

                    GroupBox {
                        Divider().padding(.vertical, 4)

                        VStack(spacing: 0) {
                            settingsRow("Developer", "Matheo Vieilleville")
                            Divider()
                            settingsRow("Designer", "Robert Petras")
                            Divider()
                            settingsRow("Compatibility", "iOS 18")
                            Divider()
                            linkRow("Website", "SwiftUI Masterclass")
                            Divider()
                            settingsRow("Version", "1.0")
                        }
                    } label: {
                        sectionLabel("apps.iphone", "APPLICATION")
                    }
                }
                .padding()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
            }
        }
    }

    private func sectionLabel(_ icon: String, _ title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.green)
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
    }

    private func settingsRow(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
        }
        .padding(.vertical, 8)
    }

    private func linkRow(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            Spacer()
            Link(destination: URL(string: "https://swiftuimasterclass.com")!) {
                HStack(spacing: 4) {
                    Text(value)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.green)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    SettingsView()
}
