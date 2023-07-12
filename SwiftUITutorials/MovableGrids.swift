//
//  MovableGrids.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/11.
//

import SwiftUI

struct MovableGrids: View {
    
    @State private var colors: [Color] = [
        .red, .blue, .brown, .purple, .yellow, .indigo, .black, .cyan, .gray
    ]
    
    @State private var draggingItem: Color?
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing: 10), count: 3)
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color.gradient)
                            .frame(height: 100)
                    }
                }
                .padding(15)
            }
            
            .navigationTitle("Movable Grid")
        }
    }
}

struct MovableGrids_Previews: PreviewProvider {
    static var previews: some View {
        MovableGrids()
    }
}
