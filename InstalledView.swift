import SwiftUI

struct InstalledView: View {
    @State private var search = ""
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Installed").font(.largeTitle.bold())
                        Text("Manage your installed packages and keep everything up to date.").foregroundStyle(.secondary)
                        TextField("Search installed packages...", text: $search).textFieldStyle(.roundedBorder)
                        GlassCard {
                            VStack(spacing: 16) {
                                PackageRow(icon: "sparkles", title: "Luminous", subtitle: "v1.2.0 • Theme")
                                Divider(); PackageRow(icon: "square.grid.2x2.fill", title: "Void Icons", subtitle: "v2.1.3 • Icons")
                                Divider(); PackageRow(icon: "photo.fill", title: "Serenity", subtitle: "v1.0.1 • Wallpaper Pack")
                                Divider(); PackageRow(icon: "wand.and.stars", title: "QuickActions", subtitle: "v1.4.0 • Tweak")
                                Divider(); PackageRow(icon: "circle.grid.3x3.fill", title: "Nebula UI", subtitle: "v3.0.2 • Theme", action: "Update")
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}
