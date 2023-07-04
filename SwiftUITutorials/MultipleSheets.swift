//
//  MultipleSheets.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/03.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheets: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "Starting title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                selectedModel = RandomModel(title: "one")
                showSheet.toggle()
            } label: {
                Text("Button1")
            }
            
            Button {
                selectedModel = RandomModel(title: "two")
                showSheet.toggle()
            } label: {
                Text("Button2")
            }
            
        }
        .sheet(isPresented: $showSheet) {
            NextScreen(selectedModel: selectedModel)
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheets_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheets()
    }
}
