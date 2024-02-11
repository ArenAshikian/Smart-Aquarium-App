//
//  FirstScreen.swift
//  Smart-Aquarium-App
//
//  Created by csuftitan on 2/10/24.
//

import SwiftUI

struct FirstScreen: View {
        var body: some View {
            ZStack{
               Text("First Screen")
                .bold()
                .font(.largeTitle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            Image("Ocean")
                .resizable()
            .clipped()
        }
    }


struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
