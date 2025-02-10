//
//  SplashScreenView.swift
//  Chronicle
//
//  Created by Sachin Sharma on 10/02/25.
//

import SwiftUI
import SwiftfulRouting

struct SplashScreenView: View {
    
    //let router: AnyRouter
    @State private var isAnimating = false
    @Binding var isSplashDismissed: Bool
    
    var body: some View {
        ZStack {
            backgroundView
            brandLogoAndName
                .scaleEffect(isAnimating ? 1 : 0.8)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 1), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    isSplashDismissed = true
                }
            }
        }
    }
    
    private var backgroundView: some View {
        LinearGradient(
            colors: [Color.blue, Color.purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    var brandLogoAndName: some View {
        VStack(spacing: 0) {
            Image(uiImage: .logo)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 80)
                .shadow(radius: 10)
            
            Text("Chronical")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .shadow(radius: 4)
        }
    }
}

#Preview {
    StartingView()
}
