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
                                // Drag
                                .draggable(color) {
                                    // Custom Preview View
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 100, height: 100)
                                        .onAppear {
                                            draggingItem = color
                                        }
                                }
                            // Drop
                                .dropDestination(for: Color.self) { items, location in
                                    draggingItem = nil
                                    return false
                                } isTargeted: { status in
                                    if let draggingItem, status, draggingItem != color {
                                        if let sourceIndex = colors.firstIndex(of: draggingItem),
                                           let destinationIndex = colors.firstIndex(of: color) {
                                            withAnimation() {
                                                let sourceItem = colors.remove(at: sourceIndex)
                                                colors.insert(sourceItem, at: destinationIndex)
                                            }
                                        }
                                    }
                                }
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
