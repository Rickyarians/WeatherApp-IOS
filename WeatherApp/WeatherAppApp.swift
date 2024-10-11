//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Ricky Ariansyah on 12/10/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
