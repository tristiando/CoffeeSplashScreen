//
//  LottieView.swift
//  CoffeeSplashScreen
//
//  Created by Thu Do on 27/08/2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    var fileName: String
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
//        animationView.play(fromProgress: 0, //Start
//                           toProgress: 1, //End
//                           loopMode: LottieLoopMode.repeat(10),//Number of Times
//                           completion: { (finished) in
//                            if finished {
//                                print("Animation Complete")
//                              } else {
//                             print("Animation cancelled")
//                             }
//                          })
       animationView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(animationView)
       
       NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo:view.widthAnchor),
       animationView.heightAnchor.constraint(equalTo:view.heightAnchor)])
      
       return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
