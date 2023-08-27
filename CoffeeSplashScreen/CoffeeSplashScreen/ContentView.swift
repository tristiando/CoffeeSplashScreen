//
//  ContentView.swift
//  CoffeeSplashScreen
//
//  Created by Thu Do on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var splashScreen = true
    
    var body: some View {
        Group {
            if splashScreen {
                SplashScreen()
            } else {
                MainView()
            }
        }
        .onAppear {
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 3) {
                    splashScreen = false
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashScreen: View {
    var body: some View {
        LottieView(fileName: "coffeesplash")
    }
}

struct MainView: View {
    var body: some View {
        Text("main view")
    }
}
