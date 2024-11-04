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
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?

    var body: some View {
        VStack{
           
            if let location = locationManager.location
            {
                if let weather = weather {
                    VStack {
                        Button(action: {
                                       resetWeather()
                                   }) {
                                       Image(systemName: "arrow.left") // Back arrow symbol
                                           .font(.title)
                                           .foregroundColor(.white).padding()
                                   }
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                   WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch let error {
                                print(error)
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                    }
                }
            }
        .background(Color(red: 11 / 255, green: 20 / 255, blue: 30 / 255)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    
        private func resetWeather() {
            weather = nil
            locationManager.resetLocation()
        }
    }

   
#Preview {
    ContentView()
}
