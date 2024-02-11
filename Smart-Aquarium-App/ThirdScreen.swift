//
//  ThirdScreen.swift
//  Smart-Aquarium-App
//
//  Created by csuftitan on 2/10/24.
//

import SwiftUI

struct ThirdScreen: View {
    var body: some View {
          ZStack{
              Text("Third Screen")
                  .bold()
                  .font(.largeTitle)
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(LinearGradient(colors: [.orange, .red],
                                         startPoint: .top,
                                         endPoint: .center))
              .clipped()
    }
}

struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen()
    }
}
