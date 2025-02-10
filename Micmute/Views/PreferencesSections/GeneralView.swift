//
//  GeneralView.swift
//  Micmute
//
//  Created by artur on 10/02/2025.
//

import SwiftUI
import KeyboardShortcuts
import LaunchAtLogin

struct GeneralView: View {
    @ObservedObject var contentViewModel = ContentViewModel()
    @ObservedObject private var launchAtLogin = LaunchAtLogin.observable
    
    var body: some View {
        VStack(spacing: 16) {
            CustomSectionView(title: "Keyboard shortcuts") {
                VStack(spacing: 12) {
                    HStack {
                        Text("Toggle mute")
                        Spacer()
                        KeyboardShortcuts.Recorder("", name: .toggleMuteShortcut)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Check mute status")
                        Spacer()
                        KeyboardShortcuts.Recorder("", name: .checkMuteShortcut)
                    }
                }
                .toggleStyle(.switch)
            }
            
            CustomSectionView(title: "Behavior") {
                VStack(spacing: 12) {
                    HStack {
                        Text("Launch Micmute at login")
                        Spacer()
                        Toggle("", isOn: $launchAtLogin.isEnabled).controlSize(.mini)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Push to talk")
                        Spacer()
                        Toggle("", isOn: contentViewModel.$pushToTalk).controlSize(.mini)
                    }
                }
                .toggleStyle(.switch)
            }
            
            CustomSectionView(title: "Menubar icon") {
                VStack(spacing: 12) {
                    HStack {
                        Text("Launch Micmute at login")
                        Spacer()
                        Toggle("", isOn: $launchAtLogin.isEnabled).controlSize(.mini)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Grayscale icon")
                        Spacer()
                        Toggle("", isOn: contentViewModel.$pushToTalk).controlSize(.mini)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Behavior on left click")
                        Spacer()
                        Picker("", selection: contentViewModel.$menuBehaviorOnClick) {
                            Text("Shows menu").tag(MenuBarBehavior.menu)
                            Text("Toggle mute").tag(MenuBarBehavior.mute)
                        }
                        .fixedSize(horizontal: true, vertical: false)
                    }
                }
                .toggleStyle(.switch)
            }
        }
        .padding()
    }
}
