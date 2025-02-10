//
//  HomeView.swift
//  Chronicle
//
//  Created by Sachin Sharma on 10/02/25.
//

import SwiftUI
import SwiftfulRouting

struct HomeView: View {
    
    // Pass reference to Router directly or pull from Environment
    @Environment(\.router) var router
    //let router: AnyRouter
    
    var body: some View {
        VStack {
            Text("Home View")
            
            Button("SHow Bottom Sheet") {
                router.showModal(transition: .move(edge: .bottom), animation: .easeInOut, alignment: .bottom, backgroundColor: Color.black.opacity(0.35), ignoreSafeArea: true) {
                    TestbottomSheetView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}


struct TestbottomSheetView: View {
    @Environment(\.router) var router
    @State private var backgroundColor: Color = .blue
    
    var body: some View {
        Text("Sample")
            .frame(maxWidth: .infinity)
            .frame(height: 350)
            .background(backgroundColor)
            .cornerRadius(30)
            .onTapGesture {
                backgroundColor = randomColor()
            }
            .onLongPressGesture(
                minimumDuration: 2) {
                    router.dismissModal()
                } onPressingChanged: { isChanged in
                    backgroundColor = randomColor()
                }

    }
    
    /// Function to generate a random color
    private func randomColor() -> Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
