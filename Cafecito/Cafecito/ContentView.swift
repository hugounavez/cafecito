import SwiftUI
import SwiftTerm

struct ContentView: View {
    @AppStorage("fontSize") private var fontSize = 13.0
    @State private var sessions: [TerminalSession] = []
    @State private var selection: TerminalSession.ID?

    var body: some View {
        NavigationSplitView {
            List(
                sessions,
                selection: $selection
            ) { session in
                SessionRow(session: session)
            }
            .toolbar {
                Button(
                    "New Tab",
                    systemImage: "plus",
                    action: addSession
                )
            }
        } detail: {
            if let session = sessions.first(where: { $0.id == selection }) {
                TerminalPane(session: session)
                    .id(session.id)
            } else {
                Text("Select a tab")
            }
        }
        .onAppear {
            if sessions.isEmpty { addSession() }
        }
    }

    private func addSession() {
        let session = TerminalSession(
            title: "tab \(sessions.count + 1)",
            fontSize: fontSize
        )
        sessions.append(session)
        selection = session.id
    }
}

#Preview {
    ContentView()
}
