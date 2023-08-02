//
//  Pomodoro.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/08/02.
//

import SwiftUI

struct PomodoroView: View {
    
    
    @State var progress = 0.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @StateObject var fastingManager = FastingManager()
    
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Let get started"
        case .fasting:
            return "you are not fasitng"
        case .feeding:
            return "you are now feeding"
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text(fastingManager.fastingPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
             Spacer()
                
            }
            .padding()
            
            VStack(spacing: 40) {
                ProgressRing
                
                HStack(spacing: 60) {
                    
                    // MARK: Start Time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "start" : "started")
                            .opacity(0.7)
                        
                        Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                        
                    }
                    
                    // MARK: End Time
                
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "end" : "ends")
                            .opacity(0.7)
                        
                        Text(fastingManager.endTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                        
                    }
                }
                
                Button {
                    fastingManager.toggleFastingState()
                } label: {
                    Text(fastingManager.fastingState == .fasting ? "End fast" : "start fasting")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }

            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct Pomodoro_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
            .preferredColorScheme(.dark)
    }
}

extension PomodoroView {
    var ProgressRing: some View {
        ZStack {
            // MARK: Placeholder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // MARK: Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(Gradient(colors: [.purple, .blue, .gray]), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
                
            
            VStack(spacing: 30) {
                if fastingManager.fastingState == .notStarted {
                    
                    VStack(spacing: 5) {
                        Text("Upcoming fast")
                            .opacity(0.7)
                        
                        Text("\(fastingManager.fastingPlan.fastingPerod.formatted())Hours")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                } else {
                    // MARK: Elapsed Time
                    VStack(spacing: 5) {
                        Text("Elapsed time")
                            .opacity(0.7)
                        Text(fastingManager.startTime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                    
                    // MARK: Remaning Time
                    VStack(spacing: 5) {
                        if !fastingManager.elapsed {
                            Text("remaning time")
                                .opacity(0.7)
                        } else {
                            Text("Extra time")
                                .opacity(0.7)
                        }
                        
                        Text(fastingManager.endTime, style: .timer)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
            }
            
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear {
            progress = 1
        }
        .onReceive(timer) { _ in
            fastingManager.track()
        }
        
    }
}
