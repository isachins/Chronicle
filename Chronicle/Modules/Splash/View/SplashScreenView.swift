//
//  SplashScreenView.swift
//  Chronicle
//
//  Created by Sachin Sharma on 10/02/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            brandLogoAndName
            
        }
    }
    
    var brandLogoAndName: some View {
        VStack(spacing: 0) {
            Image(uiImage: .logo)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 80)
            
            Text("Chronical")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .offset(y: -10)
        }
        .transition(.identity)
    }
}

#Preview {
    SplashScreenView()
}
