//
//  HomeView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-12.
//

import SwiftUI

enum SelectedView {
    case home
    case message
    case favorites
    case profile
}

struct MainView: View {
    @State var selectedView: SelectedView = .home
    var body: some View {
        GeometryReader{ geo in
            TabView {
                HomeView(selectedView: $selectedView)
                    .tabItem {
                        Label("", image: selectedView == .home ? .homeFilled : .home)
                    }
                MessageView(selectedView: $selectedView)
                    .tabItem {
                        Label("", image: selectedView == .message ? .messageFilled : .message)
                    }
                FavoritesView(selectedView: $selectedView)
                    .tabItem {
                        Label("", image: selectedView == .favorites ? .heartFilled : .heart)
                    }
                ProfileView(selectedView: $selectedView)
                    .tabItem {
                        Label("", image: selectedView == .profile ? .profileFilled : .profile)
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
