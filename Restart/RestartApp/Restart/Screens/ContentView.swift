//
//  ContentView.swift
//  Restart
//
//  Created by Iwy2th on 5/31/23.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    var body: some View {
      ZStack {
        if isOnBoardingViewActive {
          OnBoardingView()
        } else {
          HomeView() 
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
