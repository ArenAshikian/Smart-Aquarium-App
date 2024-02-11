//
//  SecondScreen.swift
//  Smart-Aquarium-App
//
//  Created by csuftitan on 2/10/24.
//

import SwiftUI

struct SecondScreen: View {
    var body: some View {
          ZStack{
             Text("Second Screen")
               .bold()
               .font(.largeTitle)
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(.mint)
          .clipped()
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
