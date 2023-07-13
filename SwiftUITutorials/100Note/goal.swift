//
//  goal.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/12.
//

import Foundation


struct goal: Identifiable {
    let id = UUID().uuidString
    let day: String
    let target: String
}
