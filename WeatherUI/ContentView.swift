//
//  ContentView.swift
//  WeatherUI
//
//  Created by Andrew Johnson on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black: .blue,
                           bottomColor: isNight ? .gray:  Color("lightBlue"))
            VStack(spacing: 8) {
                CityTextView(cityName: "Cuppertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                   
                    
                    HStack(spacing:20) {
                        WeatherDayView(dayOfWeek: "TUE",
                                       imageName: isNight ? "moon.fill": "sun.max.fill",
                                       temperature: 88)
                        WeatherDayView(dayOfWeek: "WED",
                                       imageName: "wind",
                                       temperature: 55)
                        WeatherDayView(dayOfWeek: "THUR",
                                       imageName: isNight ? "cloud.moon.fill": "cloud.sun.fill",
                                       temperature: 60)
                        WeatherDayView(dayOfWeek: "FRI",
                                       imageName: "snow",
                                       temperature: 25)
                        WeatherDayView(dayOfWeek: "SAT",
                                       imageName: "cloud.fill",
                                       temperature: 33)
                        
                        
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change Day Time",
                                      textColor: .blue,
                                      backgroundColor: .white)
                    }
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
    
    #Preview {
        ContentView()
    }
    
    struct WeatherDayView: View {
        
        
        var dayOfWeek: String
        var imageName: String
        var temperature: Int
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
    
    struct BackgroundView: View {
        
        
        var topColor: Color
        var bottomColor: Color
        var body: some View {
            
            LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    struct CityTextView: View {
        
        var cityName: String
        
        var body: some View {
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding()
        }
    }
    
struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundStyle(.white)
        
            .padding(40)
    }
       
}
            
    




