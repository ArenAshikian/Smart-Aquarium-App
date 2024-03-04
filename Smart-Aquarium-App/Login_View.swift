//
//  Login_View.swift
//  Smart-Aquarium-App
//
//  Created by csuftitan on 3/4/24.
//

import SwiftUI

struct Login_View: View {
    var body: some View {
        VStack(spacing: 28) {
            InfoText().padding(.top, 44)
        }
        .padding()
    }
}

struct InfoText: View {
    var body: some View {
        Text("Enter your login and password")
            .font(.system(size: 16, weight: .light))
            .foregroundColor(.primary)
    }
}
struct Login_View_Previews: PreviewProvider {
    static var previews: some View {
        Login_View()
    }
}
