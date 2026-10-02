import SwiftUI

struct GlassCard<Content: View>: View {
    @ViewBuilder var content: () -> Content
    var body: some View {
        content()
            .padding(16)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 22, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.white.opacity(0.08)))
    }
}

struct ScreenBackground: View {
    var body: some View {
        LinearGradient(colors: [Color.black, Color(red: 0.025, green: 0.05, blue: 0.10), Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct PackageRow: View {
    let icon: String
    let title: String
    let subtitle: String
    var action: String = "Enabled"
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12).fill(Color.cyan.opacity(0.15))
                Image(systemName: icon).foregroundStyle(.cyan)
            }.frame(width: 46, height: 46)
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.headline)
                Text(subtitle).font(.caption).foregroundStyle(.secondary)
            }
            Spacer()
            Text(action).font(.caption.bold()).padding(.horizontal, 10).padding(.vertical, 6)
                .background(action == "Update" ? Color.blue.opacity(0.28) : Color.green.opacity(0.20), in: Capsule())
                .foregroundStyle(action == "Update" ? .blue : .green)
        }
    }
}
