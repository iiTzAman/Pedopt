//
//  FavoritesView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-13.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var selectedView: SelectedView

    var body: some View {
        GeometryReader { geo in
            Text("Favorites")

        }
        .onAppear{
            selectedView = .favorites
        }
    }
}

#Preview {
    FavoritesView(selectedView: .constant(.favorites))
}
