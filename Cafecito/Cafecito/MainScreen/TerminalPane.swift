//
//  TerminalPane.swift
//  Cafecito
//
//  Created by Hugo Reyes on 11/17/26.
//

import SwiftUI
import SwiftTerm

struct TerminalPane: NSViewRepresentable {
    let session: TerminalSession
    @AppStorage("fontSize") private var fontSize = 13.0

    func makeNSView(context: Context) -> LocalProcessTerminalView {
        session.view
    }

    func updateNSView(
        _ nsView: LocalProcessTerminalView,
        context: Context
    ) {
        nsView.font = NSFont.monospacedSystemFont(
            ofSize: fontSize,
            weight: .regular
        )
    }
}
