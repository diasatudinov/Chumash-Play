//
//  CPMenuView.swift
//  Chumash Play
//
//

import SwiftUI

struct CPMenuView: View {
    @State private var showGame = false
    @State private var showShop = false
    @State private var showAchievement = false
    @State private var showMiniGames = false
    @State private var showSettings = false
    @State private var showCalendar = false
    @State private var showDailyReward = false
    
//    @StateObject var shopVM = JGShopViewModel()
    
    var body: some View {
        
        ZStack {
            
                
                VStack(spacing: 0) {
                    
                    HStack {
                        
                        Button {
                            showSettings = true
                        } label: {
                            Image(.settingsIconCP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        
                        Button {
                            withAnimation {
                                showDailyReward = true
                            }
                        } label: {
                            Image(.dailyRewardsIconCP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        
                        Spacer()
                        
                        JGCoinBg()
                    }.padding(20)
                    Spacer()
                    
                    VStack(spacing: 7) {
                        
                        Button {
                            showShop = true
                        } label: {
                            Image(.shopIconCP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 140:75)
                        }
                        
                        Button {
                            showGame = true
                        } label: {
                            Image(.playIconCP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 140:75)
                        }
                        
                        Button {
                            showAchievement = true
                        } label: {
                            Image(.achievementsIconCP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 140:75)
                        }
                        
                    }
                    Spacer()
                }
                                
                
                        
        }.frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(.mainMenuBgCP)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                }
            )
            .fullScreenCover(isPresented: $showGame) {
//                GameRootView()
            }
            .fullScreenCover(isPresented: $showAchievement) {
//                JGAchievementsView()
            }
            .fullScreenCover(isPresented: $showShop) {
//                JGShopView(viewModel: shopVM)
            }
            .fullScreenCover(isPresented: $showSettings) {
//                JGSettingsView()
            }
    }
}

#Preview {
    CPMenuView()
}
