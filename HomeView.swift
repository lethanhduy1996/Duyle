import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                ScrollView {
                    VStack(spacing: 18) {
                        VStack(spacing: 2) {
                            Text("1996").font(.system(size: 44, weight: .thin, design: .serif)).foregroundStyle(.linearGradient(colors: [.cyan, .blue, .purple], startPoint: .leading, endPoint: .trailing))
                            Text("MAKE IT YOURS").font(.caption2).tracking(5).foregroundStyle(.secondary)
                        }.padding(.top, 8)
                        GlassCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("FEATURED").font(.caption.bold()).foregroundStyle(.cyan)
                                Text("Midnight Atmosphere").font(.title2.bold())
                                Text("A complete theme experience for a cleaner, bolder look.").foregroundStyle(.secondary)
                                HStack { Spacer(); Image(systemName: "arrow.right.circle.fill").font(.system(size: 36)).foregroundStyle(.cyan) }
                            }
                            .frame(maxWidth: .infinity, minHeight: 150, alignment: .bottomLeading)
                            .background(
                                LinearGradient(colors: [.indigo.opacity(0.55), .blue.opacity(0.25), .clear], startPoint: .topTrailing, endPoint: .bottomLeading)
                            )
                        }
                        HStack(spacing: 10) {
                            quick("Browse Store", "bag.fill")
                            quick("Installed", "shippingbox.fill")
                            quick("Manage Files", "folder.fill")
                        }
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Recent Downloads").font(.title3.bold())
                            GlassCard {
                                VStack(spacing: 16) {
                                    PackageRow(icon: "paintpalette.fill", title: "Aurora UI", subtitle: "Theme Package • 24 MB")
                                    Divider()
                                    PackageRow(icon: "square.grid.2x2.fill", title: "Nebula Icons", subtitle: "Icon Pack • 12 MB")
                                    Divider()
                                    PackageRow(icon: "photo.fill", title: "Serenity", subtitle: "Wallpaper Pack • 36 MB")
                                }
                            }
                        }
                    }.padding()
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    private func quick(_ title: String, _ icon: String) -> some View {
        GlassCard {
            VStack(spacing: 8) { Image(systemName: icon).foregroundStyle(.cyan); Text(title).font(.caption).multilineTextAlignment(.center) }
                .frame(maxWidth: .infinity)
        }
    }
}
