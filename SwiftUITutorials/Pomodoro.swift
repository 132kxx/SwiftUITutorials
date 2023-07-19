//
//  Pomodoro.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/18.
//

import SwiftUI

struct Pomodoro: View {
    
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    @State var totalTime: Int = 0
    @State var isPlaying: Bool = false
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        VStack {
            
            // total time table
            HStack {
                VStack {
                    Text("오늘 집중한 시간")
                    Text("\(timeString(from: totalTime))")
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 4)
            
            // todolist table
            VStack(alignment: .leading) {
                Text("todo list")
                    .frame(maxWidth: .infinity)
                    .font(.title2)
                    .padding(.bottom, 6)
                
                HStack {
                    Image(systemName: "checkmark.square")
                    Text("타이머 완성시키기")
                }
                
                HStack {
                    Image(systemName: "checkmark.square")
                    Text("커밋하기")
                }
            }
            
            // timer circle
            Circle().stroke()
                .frame(width: 300, height: 300)
                .padding()
                .overlay {
                    Text("\(timeString(from: timeElapsed))")
                        .font(.title)
                        .onReceive(timer) { firedDate in
                            if isPlaying {
                                
                            }
                        }
                }
            
            //time selector
            HStack(spacing: 20) {
                Button {
                    timeElapsed = 1200
                } label: {
                    Text("5")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Color.black
                        }
                        .cornerRadius(10)

                }
                
                Button {
                    //
                } label: {
                    Text("10")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Color.black
                        }
                        .cornerRadius(10)
                }
                
                Button {
                    //
                } label: {
                    Text("30")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Color.black
                        }
                        .cornerRadius(10)
                }
                
                Button {
                    //
                } label: {
                    Text("60")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Color.black
                        }
                        .cornerRadius(10)
                }


            }
            
            //start btn
            HStack {
                Button {
                    isPlaying = true
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                } label: {
                    Text("Start")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Color.blue
                        }
                        .cornerRadius(10)
                    
                }
                
                Button {
                    timer.upstream.connect().cancel()
                    if !isPlaying {
                        timeElapsed = 0
                    }
                    isPlaying = false
                } label: {
                    Text(isPlaying ? "pause" : "reset")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Color.gray
                        }
                        .cornerRadius(10)
                }

            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct Pomodoro_Previews: PreviewProvider {
    static var previews: some View {
        Pomodoro()
    }
}

extension Pomodoro {
    func timeString(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
