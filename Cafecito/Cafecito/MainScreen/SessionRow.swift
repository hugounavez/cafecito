//
//  SessionRow.swift
//  Cafecito
//
//  Created by Hugo Reyes on 11/17/26.
//

import SwiftUI

struct SessionRow: View {
    @Bindable var session: TerminalSession
    @State private var isEditing = false
    @FocusState private var focused: Bool
    
    var body: some View {
        Group {
            if isEditing {
                TextField("Name", text: $session.title)
                    .focused($focused)
                    .onSubmit { isEditing = false }
                    .onExitCommand { isEditing = false }
            } else {
                Text(session.title)
                    .onTapGesture(count: 2) { beginEditing() }
            }
        }
        .contextMenu {
            Button("Rename") { beginEditing() }
        }
    }
            
    private func beginEditing() {
        isEditing = true
        focused = true
    }
}
