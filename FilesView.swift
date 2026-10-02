import SwiftUI
import UniformTypeIdentifiers

struct FilesView: View {
    @State private var showingImporter = false
    @State private var importedName: String?
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Files").font(.largeTitle.bold())
                        GlassCard {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack { Image(systemName: "internaldrive.fill").foregroundStyle(.cyan); Text("Internal Storage").font(.headline); Spacer(); Text("Demo") }
                                ProgressView(value: 0.49).tint(.cyan)
                                Text("App sandbox storage").font(.caption).foregroundStyle(.secondary)
                            }
                        }
                        Button { showingImporter = true } label: {
                            Label("Import ZIP / Package", systemImage: "square.and.arrow.down.fill").frame(maxWidth: .infinity).padding()
                        }.buttonStyle(.borderedProminent).tint(.blue)
                        if let importedName { Text("Imported: \(importedName)").font(.footnote).foregroundStyle(.green) }
                        Text("Folders").font(.title2.bold())
                        GlassCard {
                            VStack(spacing: 14) {
                                folder("Themes", "24 items"); Divider(); folder("Icons", "18 items"); Divider(); folder("Tweaks", "12 items"); Divider(); folder("Wallpapers", "36 items")
                            }
                        }
                    }.padding()
                }
            }
            .fileImporter(isPresented: $showingImporter, allowedContentTypes: [.zip, .data]) { result in
                if case .success(let url) = result { importedName = url.lastPathComponent }
            }
        }
    }
    private func folder(_ name: String, _ subtitle: String) -> some View {
        HStack { Image(systemName: "folder.fill").foregroundStyle(.blue); VStack(alignment: .leading) { Text(name); Text(subtitle).font(.caption).foregroundStyle(.secondary) }; Spacer(); Image(systemName: "chevron.right").foregroundStyle(.secondary) }
    }
}
