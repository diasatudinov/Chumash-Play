//
//  JGSettingsViewModel.swift
//  Chumash Play
//
//


import SwiftUI

class JGSettingsViewModel: ObservableObject {
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
}
