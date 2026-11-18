import SwiftUI

@main struct MyApp: App {
    @AppStorage("fontSize") private var fontSize = 13.0

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(after: .toolbar) {
                Button("Increase Font Size") { fontSize = min(fontSize + 1, 72) }
                    .keyboardShortcut("+", modifiers: .command)
                Button("Increase Font Size") { fontSize = min(fontSize + 1, 72) }
                    .keyboardShortcut("=", modifiers: .command)
                Button("Decrease Font Size") { fontSize = max(fontSize - 1, 6) }
                    .keyboardShortcut("-", modifiers: .command)
                Button("Reset Font Size") { fontSize = 13 }
                    .keyboardShortcut("0", modifiers: .command)
            }
        }
    }
}
