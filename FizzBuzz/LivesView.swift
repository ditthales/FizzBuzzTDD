//
//  LivesView.swift
//  FizzBuzz
//
//  Created by Lucas Migge de Barros on 17/02/23.
//

import SwiftUI

struct LivesView: View {
    @Binding var totalLives: Int
    @Binding var remainingLives: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            
            ForEach(0..<totalLives, id: \.self) { index in
                Image(systemName: index < remainingLives ? "heart" : "heart.fill")
                    .foregroundColor(.red)
                    .scaleEffect(1.5)
            }
            
        }

    }
}

struct LivesView_Previews: PreviewProvider {
    static var previews: some View {
        LivesView(totalLives: .constant(3), remainingLives: .constant(1))
    }
}
