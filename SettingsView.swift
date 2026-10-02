import SwiftUI

struct SettingsView: View {
    @State private var notifications = true
    @State private var autoUpdate = true
    @State private var wifiOnly = false
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                Form {
                    Section("Appearance") {
                        Label("Theme", systemImage: "circle.lefthalf.filled")
                        Label("Accent Color", systemImage: "paintpalette.fill")
                        Label("Interface Style", systemImage: "rectangle.3.group.fill")
                        Label("App Icon", systemImage: "app.fill")
                    }
                    Section("Preferences") {
                        Toggle("Notifications", isOn: $notifications)
                        Toggle("Auto Update Packages", isOn: $autoUpdate)
                        Toggle("Download over Wi‑Fi only", isOn: $wifiOnly)
                        Label("Clear Cache", systemImage: "trash.fill")
                    }
                    Section("Backup & Restore") {
                        Label("Backup", systemImage: "icloud.and.arrow.up.fill")
                        Label("Restore", systemImage: "arrow.clockwise.icloud.fill")
                    }
                    Section("About") {
                        HStack { Text("1996"); Spacer(); Text("Version 1.0.0").foregroundStyle(.secondary) }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Settings")
        }
    }
}
