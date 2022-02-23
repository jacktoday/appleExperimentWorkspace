//
//  WeatherApp.swift
//  Shared
//
//  Created by fulin on 6/2/22.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView().environmentObject(modelData)
            }
        }
    }
}
