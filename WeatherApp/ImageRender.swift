import SwiftUI

// Step 1: Create a simple model for weather condition
enum WeatherCondition {
    case sunny
    case rainy
    case cloudy
}

// Step 2: Create a view that takes a weather condition
struct ImageRenderView: View {
    var condition: WeatherCondition
    
    var body: some View {
        VStack {
            // Step 3: Use a switch statement to choose the correct image
            Image(systemName: weatherImageName(for: condition))
                .resizable()
                .frame(width: 100, height: 100) // Adjust size as needed
                .foregroundColor(.yellow) // Color for sunny icon
            Text(weatherDescription(for: condition))
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
    }
    
    // Function to return image name based on weather condition
    private func weatherImageName(for condition: WeatherCondition) -> String {
        switch condition {
        case .sunny:
            return "sun.max" // SF Symbol for sunny weather
        case .rainy:
            return "cloud.rain" // SF Symbol for rainy weather
        case .cloudy:
            return "cloud" // SF Symbol for cloudy weather
        }
    }
    
    // Function to return description based on weather condition
    private func weatherDescription(for condition: WeatherCondition) -> String {
        switch condition {
        case .sunny:
            return "It's sunny!"
        case .rainy:
            return "It's raining!"
        case .cloudy:
            return "It's cloudy!"
        }
    }
}

// Step 4: Main App struct
struct ContentView: View {
    var body: some View {
        // Example usage of WeatherView with different conditions
        VStack(spacing: 40) {
            ImageRenderView(condition: .sunny)
            ImageRenderView(condition: .rainy)
            ImageRenderView(condition: .cloudy)
        }
    }
}

// Step 5: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
