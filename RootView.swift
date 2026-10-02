import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Home", systemImage: "house.fill") }
            StoreView().tabItem { Label("Store", systemImage: "bag.fill") }
            InstalledView().tabItem { Label("Installed", systemImage: "shippingbox.fill") }
            FilesView().tabItem { Label("Files", systemImage: "folder.fill") }
            SettingsView().tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
        .tint(.cyan)
    }
}
