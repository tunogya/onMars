//
//  onMarsApp.swift
//  onMars
//
//  Created by 丁涯 on 2021/3/28.
//

import SwiftUI

@main
struct onMarsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
