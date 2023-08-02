//
//  FastingManager.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/08/02.
//

import Foundation

enum FastingState {
    case notStarted
    case fasting
    case feeding
}

enum FastingPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    var fastingPerod: Double {
        switch self {
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
}

class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingPlan = .intermediate
    @Published private(set) var startTime: Date {
        didSet {
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTIme)
            } else {
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
    }
    @Published private(set) var endTime: Date
    
    @Published private(set) var elapsed: Bool = false
    
    var fastingTIme: Double {
        return fastingPlan.fastingPerod
    }
    
    var feedingTime: Double {
        return 24 - fastingPlan.fastingPerod
    }
    
    init() {
        let calendar = Calendar.current
//
//        var components = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
//        components.hour = 20
//
//        let scheduledTime = calendar.date(from: components) ?? Date.now
//
        
        let components = DateComponents(hour: 20)
        
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPerod)
    }
    
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
        startTime = Date()
    }
    
    func track() {
        guard fastingState != .notStarted else { return }
        if endTime >= Date() {
            elapsed = false
        } else {
            elapsed = true
        }
    }
}
