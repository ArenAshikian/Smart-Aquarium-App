//
//  FourthScreen.swift
//  Smart-Aquarium-App
//
//  Created by csuftitan on 2/10/24.
//

import SwiftUI

struct FourthScreen: View {
    var body: some View {
         ZStack{
            Text("Fourth Screen")
              .bold()
              .font(.largeTitle)
            }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.blue.opacity(0.5))
           .clipped()
    }
}

struct FourthScreen_Previews: PreviewProvider {
    static var previews: some View {
        FourthScreen()
    }
}
