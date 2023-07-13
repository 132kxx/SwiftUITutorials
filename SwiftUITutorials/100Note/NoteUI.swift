//
//  NoteUI.swift
//  SwiftUITutorials
//
//  Created by kxx on 2023/07/12.
//

import SwiftUI

struct NoteUI: View {
    
    @StateObject var vm: GoalViewModel = GoalViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }

                Spacer()
                Button {
                    //
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }

            }
            .padding(.horizontal, 30)
            NavigationStack {
                VStack {
                    HStack {
                        VStack {
                            Text("달성률")
                            Text("\(vm.goals.count*100/100)%")
                        }
                        .frame(maxWidth: .infinity)

                        VStack {
                            Text("기록수")
                            Text("\(vm.goals.count)")
                        }
                        .frame(maxWidth: .infinity)
                    }

                    ScrollView(.vertical, showsIndicators: false) {
                        
                        Text("내가 이루고자 하는 목표는 무엇인가?")
                        
                        ForEach(vm.goals) { goal in
                            HStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        Text(goal.day)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                
                                Text(goal.target)
                                
                                Spacer()
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal, 15)
                    

                }
                
                .navigationTitle("My 100 Note")
            }

        }
    }
}

struct NoteUI_Previews: PreviewProvider {
    static var previews: some View {
        NoteUI()
    }
}
