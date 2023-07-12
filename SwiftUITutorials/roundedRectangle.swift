//
//  roundedRectangle.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/08.
//

import SwiftUI

struct roundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
    }
}

struct roundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        roundedRectangle()
    }
}
