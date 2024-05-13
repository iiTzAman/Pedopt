//
//  HomeView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-13.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedView: SelectedView
    var body: some View {
        GeometryReader { geo in
            

        }
        .onAppear{
            selectedView = .home
        }
    }
}

#Preview {
    HomeView(selectedView: .constant(.home))
}
