//
//  MessageView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-13.
//

import SwiftUI

struct MessageView: View {
    @Binding var selectedView: SelectedView

    var body: some View {
        GeometryReader { geo in
            Text("Message")

        }
        .onAppear{
            selectedView = .message
        }
    }
}

#Preview {
    MessageView(selectedView: .constant(.message))
}
