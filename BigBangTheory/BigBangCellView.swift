//
//  BigBangCellView.swift
//  BigBangTheory
//
//  Created by Yery Castro on 18/3/24.
//

import SwiftUI

struct BigBangCellView: View {
    
    
    let title: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
                .bold()
            Text(label)
                .font(.subheadline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    BigBangCellView(title: "Episodio", label: "The Peanut Reaction")
        
}
