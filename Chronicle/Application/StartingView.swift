//
//  StartingView.swift
//  Chronicle
//
//  Created by Sachin Sharma on 10/02/25.
//

import SwiftUI
import SwiftfulRouting

struct StartingView: View {
    @State var isSplashDismissed: Bool = false
    
    var body: some View {
        ZStack {
            if isSplashDismissed {
                RouterView(addNavigationView: true) { router in
                    HomeView()
                        .transition(.opacity) // Smooth fade transition
                        .environment(\.router, router) // Inject router into the environment
                }
            } else {
                SplashScreenView(isSplashDismissed: $isSplashDismissed)
                    .transition(.opacity) // Smooth fade effect
            }
        }
        .animation(.easeOut(duration: 0.5), value: isSplashDismissed)
    }
}

#Preview {
    StartingView()
}
