//
//  BigBangTheoryApp.swift
//  BigBangTheory
//
//  Created by Yery Castro on 14/3/24.
//

import SwiftUI

@main
struct BigBangTheoryApp: App {
    @StateObject var vm = BigBangVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(vm)
    }
}
