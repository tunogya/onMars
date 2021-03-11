//
//  onMarsApp.swift
//  Shared
//
//  Created by 丁涯 on 2021/3/11.
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
