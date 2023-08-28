//
//  ContentView.swift
//  CoffeeSplashScreen
//
//  Created by Thu Do on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSplashView = true
    
    var body: some View {
        Group {
            if showSplashView {
                SplashView()
            } else {
                MainView()
            }
        }
        .onAppear {
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 3) {
                    showSplashView = false
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashView: View {
    var body: some View {
        LottieView(fileName: "coffeesplash")
    }
}

struct MainView: View {
    
    @State var showCafeText = false
    @State var moveMugUp = false
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            LoginView()
            ZStack{
                Text("C A F É")
                    .font(.system(size: 70))
                    .fontWeight(.light)
                    .foregroundColor(Color("coffee"))
                    .multilineTextAlignment(.leading)
                    .frame(width: 350, height: 200)
                    .offset(x: 0, y: -100)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 350, height: 200)
                    .opacity(showCafeText ? 0 : 1)
                    .offset(x: 0, y: -100)
                    .animation(Animation.easeInOut(duration: 3), value: showCafeText)
                    .onAppear() {
                        self.showCafeText.toggle()
                    }
            }
            
            Image("coffeepic")
                .resizable()
                .frame(width: 294, height: 294)
                .offset(x: 12.5, y: moveMugUp ? -240 : 7)
                .animation(Animation.easeInOut(duration: 1), value: moveMugUp)
                .onAppear() {
                    self.moveMugUp.toggle()
                }
            
        }
    }
}

struct LoginView: View {
    @State var changeOffset  = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("coffee"))
            
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(Color.white.opacity(1))
                .offset(x: 0, y: -720)
            
            ZStack{
                Text("Find The Best Coffee for You.")
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350, height: 200)
                    .offset(x: -5, y: -290)
                
                Text("Lorem ipsum dolor sit amet, adipiscing elit. Nullam pulvinar dolor sed enim eleifend efficitur.")
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white.opacity(0.8))
                    .multilineTextAlignment(.leading)
                    .frame(width: 350, height: 200)
                    .offset(x: 0, y: -170)
            }.padding()
        }
        .offset(x: 0, y: changeOffset ?  400 : 700)
        .animation(Animation.easeInOut(duration: 1), value: changeOffset)
        .onAppear() {
            self.changeOffset.toggle()
        }
    }
}
