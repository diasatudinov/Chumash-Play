//
//  CPAchievementsView.swift
//  Chumash Play
//
//

import SwiftUI

struct CPAchievementsView: View {
    @State private var achivementView = true
    @StateObject var user = JGUser.shared
        @Environment(\.presentationMode) var presentationMode

        @StateObject var viewModel = NEGAchievementsViewModel()
        @State private var index = 0
        var body: some View {
            ZStack {
                Image(achivementView ? .achievementsBgCP: .dailyBgCP)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .onTapGesture {
                        achivementView.toggle()
                    }
                
                VStack {
                    ZStack {
                        HStack(alignment: .top) {
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                                
                            } label: {
                                Image(.backBtnCP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: JGDeviceManager.shared.deviceType == .pad ? 100:60)
                            }
                            
                            Spacer()
                            JGCoinBg()
                        }
                    }.padding([.top])
                    
                    ScrollView {
                        if achivementView {
                            VStack {
                                
                                ForEach(viewModel.achievements, id: \.self) { item in
                                    achievementItem(item: item)
                                        .onTapGesture {
                                            viewModel.achieveToggle(item)
                                            if !item.isAchieved {
                                                user.updateUserMoney(for: 10)
                                            }
                                        }
                                }
                                
                            }
                        } else {
                            VStack {
                                
                                ForEach(viewModel.dailyQuests, id: \.self) { item in
                                    achievementItem(item: item)
                                        .onTapGesture {
                                            viewModel.questsToggle(item)
                                            if !item.isAchieved {
                                                user.updateUserMoney(for: 10)
                                            }
                                        }
                                }
                                
                            }
                        }
                    }.padding()
                    
                }
            }
            .background(
                ZStack {
                    Image(.appBgCP)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    
                }
            )
        }
        
    @ViewBuilder func achievementItem(item: NEGAchievement) -> some View {
        HStack(spacing: 0) {
            if !item.image.isEmpty {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: JGDeviceManager.shared.deviceType == .pad ? 100:60)
            }
            
            Image(item.title)
                .resizable()
                .scaledToFit()
                .frame(width: JGDeviceManager.shared.deviceType == .pad ? 300:245)
            
            Image(.claimBtnCP)
                .resizable()
                .scaledToFit()
                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 50:36)
                .opacity(item.isAchieved ? 0:1)
        }.opacity(item.isAchieved ? 1:0.5)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(.black.opacity(0.5))
            .cornerRadius(4)
    }
}

#Preview {
    CPAchievementsView()
}
