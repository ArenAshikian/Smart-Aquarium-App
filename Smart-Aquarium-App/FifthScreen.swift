//
//  FifthScreen.swift
//  Smart-Aquarium-App
//
//  Created by csuftitan on 2/10/24.
//

import SwiftUI

struct FifthScreen: View {
    var body: some View {
         ZStack{
            Text("Fifth Screen")
               .bold()
               .font(.largeTitle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green.opacity(0.3))
            .clipped()
    }
}

struct FifthScreen_Previews: PreviewProvider {
    static var previews: some View {
        FifthScreen()
    }
}
