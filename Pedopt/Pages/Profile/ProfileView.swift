//
//  ProfileView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-13.
//

import SwiftUI

struct ProfileView: View {
    @Binding var selectedView: SelectedView

    var body: some View {
        GeometryReader { geo in
            Text("Profile")

        }
        .onAppear{
            selectedView = .profile
        }
    }
}

#Preview {
    ProfileView(selectedView: .constant(.profile))
}
