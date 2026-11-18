//
//  TerminalSession.swift
//  Cafecito
//
//  Created by Hugo Reyes on 11/17/26.
//
import SwiftUI
import SwiftTerm

@Observable
final class TerminalSession: Identifiable {
    let id = UUID()
    var title: String
    let view: LocalProcessTerminalView

    init(title: String, fontSize: Double) {
        self.title = title
        view = LocalProcessTerminalView(frame: .zero)
        view.font = NSFont.monospacedSystemFont(
            ofSize: fontSize,
            weight: .regular
        )
        view.startProcess(
            executable: "/bin/zsh",
            args: ["-l"],
            currentDirectory: NSHomeDirectory()
        )
    }
}
