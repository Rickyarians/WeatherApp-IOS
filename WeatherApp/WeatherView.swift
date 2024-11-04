//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Ricky Ariansyah on 16/10/24.
//

import SwiftUI


struct WeatherView: View {
    var weather: ResponseBody
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(.title) .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light).frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    
                    VStack {
                        RenderImageView(condition: weather.weather[0].main)
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(weather.main.temp.roundDouble()  + "\u{00B0}")
                        .font(.system(size: 72))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    Spacer()
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        alignment: .leading)
                
               
                Spacer()
                VStack(spacing: 20) {
                           HStack(spacing: 20) {
                               ZStack(alignment: .topTrailing) {
                                   Rectangle()
                                       .fill(Color(red: 32 / 255, green: 43 / 255, blue: 61 / 255))
                                       .frame(height: 100).cornerRadius(10)
                                   VStack(alignment : .leading){
                                       Text("UV Index")
                                           .foregroundColor(Color(red: 87 / 255, green: 95 / 255, blue : 112 / 255))
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 1)
                                       Text(String(Int(weather.main.humidity)))
                                           .foregroundColor(.white).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                   }.frame(maxWidth: .infinity, alignment: .topLeading)
                                       .padding()
                               }
                             
                               
                               ZStack(alignment: .topTrailing) {
                                   Rectangle()
                                       .fill(Color(red: 32 / 255, green: 43 / 255, blue: 61 / 255))
                                       .frame(height: 100).cornerRadius(10)
                                   VStack(alignment : .leading){
                                       Text("Wind Speed")
                                           .foregroundColor(Color(red: 87 / 255, green: 95 / 255, blue : 112 / 255))
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 1)
                                       Text("\(String(weather.wind.speed)) m/s")
                                            .foregroundColor(.white)
                                            .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                   }.frame(maxWidth: .infinity, alignment: .topLeading) // Mengatur rata kanan atas
                                       .padding()
                               }
                           }
                           
                           HStack(spacing: 20) {
                               ZStack(alignment: .topTrailing) {
                                   Rectangle()
                                       .fill(Color(red: 32 / 255, green: 43 / 255, blue: 61 / 255))
                                       .frame(height: 100).cornerRadius(10)
                                   VStack(alignment : .leading){
                                       Text("Pressure")
                                           .foregroundColor(Color(red: 87 / 255, green: 95 / 255, blue : 112 / 255))
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 1)
                                       Text(String(Int(weather.main.pressure)))
                                            .foregroundColor(.white)
                                            .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                   }.frame(maxWidth: .infinity, alignment: .topLeading)
                                       .padding()
                               }
                               ZStack(alignment: .topTrailing) {
                                   Rectangle()
                                       .fill(Color(red: 32 / 255, green: 43 / 255, blue: 61 / 255))
                                       .frame(height: 100).cornerRadius(10)
                                   VStack(alignment : .leading){
                                       Text("Sea Level")
                                           .foregroundColor(Color(red: 87 / 255, green: 95 / 255, blue : 112 / 255))
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 1)
                                       Text(String(Int(weather.main.sea_level)))
                                            .foregroundColor(.white)
                                            .font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                   }.frame(maxWidth: .infinity, alignment: .topLeading)
                                       .padding()
                               }
                           }
                       }
                       .padding()
                
                
            }.padding()
                .frame(maxWidth: .infinity, 
                       alignment: .leading)
        }.edgesIgnoringSafeArea(.bottom)
            .background(Color(red: 11 / 255, green: 20 / 255, blue: 30 / 255))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}


struct RenderImageView: View {
    var condition: String
    
    var body: some View {
        VStack {
          
            Image(systemName: weatherImageName(for: condition))
                .resizable()
                .frame(width: 90, height: 90)
                .foregroundColor(condition == "sunny" || condition == "sun" ? .yellow : .white)
           
        }
        .padding()
    }
    
    // Function to return image name based on weather condition
    private func weatherImageName(for condition: String) -> String {
        switch condition.lowercased() {
        case "sunny", "sun":
            return "sun.max"
        case "rainy", "rain":
            return "cloud.rain"
        case "clouds", "cloud":
            return "cloud"
        default:
            return "sun.max"
        }
    }
    
   
}

#Preview {
    WeatherView(weather: previewWeather)
}
