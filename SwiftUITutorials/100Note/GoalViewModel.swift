//
//  GoalViewModel.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/12.
//

import SwiftUI

class GoalViewModel: ObservableObject {
    var goals: [goal]
    
    init() {
        goals = dommy
    }
    
    var dommy: [goal] = [
        goal(day: "12", target: "앱수익 근로소득 넘기기"),
        goal(day: "13", target: "앱수익 근로소득 넘기기"),
        goal(day: "14", target: "앱수익 근로소득 넘기기"),
        goal(day: "15", target: "앱수익 근로소득 넘기기"),
        goal(day: "16", target: "앱수익 근로소득 넘기기"),
        goal(day: "17", target: "앱수익 근로소득 넘기기"),
        goal(day: "18", target: "앱수익 근로소득 넘기기"),
        goal(day: "19", target: "앱수익 근로소득 넘기기"),
        goal(day: "20", target: "앱수익 근로소득 넘기기"),
        goal(day: "21", target: "앱수익 근로소득 넘기기"),
        goal(day: "22", target: "앱수익 근로소득 넘기기"),
        goal(day: "23", target: "앱수익 근로소득 넘기기"),
        goal(day: "24", target: "앱수익 근로소득 넘기기"),
        goal(day: "25", target: "앱수익 근로소득 넘기기"),
        goal(day: "26", target: "앱수익 근로소득 넘기기"),
        goal(day: "27", target: "앱수익 근로소득 넘기기")
    ]
}
