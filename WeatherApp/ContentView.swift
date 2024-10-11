//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ricky Ariansyah on 12/10/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack{
            if let location = locationManager.location
            {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                    }
                }
            }
           .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }

   
#Preview {
    ContentView()
}
