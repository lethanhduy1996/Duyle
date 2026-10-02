import SwiftUI

struct StoreView: View {
    @State private var search = ""
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Store").font(.largeTitle.bold())
                        TextField("Search themes, icons, tweaks...", text: $search).textFieldStyle(.roundedBorder)
                        Text("Trending").font(.title2.bold())
                        GlassCard {
                            VStack(alignment: .leading, spacing: 8) {
                                Image(systemName: "sparkles").font(.largeTitle).foregroundStyle(.cyan)
                                Text("Luminous").font(.title.bold())
                                Text("Complete Theme Pack").foregroundStyle(.secondary)
                                HStack { Text("Popular").font(.caption).padding(7).background(.thinMaterial, in: Capsule()); Spacer(); Image(systemName: "arrow.down.circle.fill").font(.title).foregroundStyle(.blue) }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Text("Categories").font(.title2.bold())
                        LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 12) {
                            category("Themes", "paintpalette.fill")
                            category("Icons", "square.grid.2x2.fill")
                            category("Tweaks", "wand.and.stars")
                            category("Wallpapers", "photo.fill")
                        }
                    }.padding()
                }
            }
        }
    }
    private func category(_ title: String, _ icon: String) -> some View {
        GlassCard { VStack { Image(systemName: icon).foregroundStyle(.cyan); Text(title).font(.headline) }.frame(maxWidth: .infinity) }
    }
}
