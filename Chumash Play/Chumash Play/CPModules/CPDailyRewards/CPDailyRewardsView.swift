//
//  CPDailyRewardsView.swift
//  Chumash Play
//
//

import SwiftUI

struct CPDailyRewardsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = DailyRewardsViewModel()
//    @StateObject var shopVM = NEGShopViewModel()
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)
    private let dayCellHeight: CGFloat = JGDeviceManager.shared.deviceType == .pad ? 200:108
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                ZStack {
                    
                    Image(.dailyRewardsBgCP)
                        .resizable()
                        .scaledToFit()
                    
                    
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(1...viewModel.totalDaysCount, id: \.self) { day in
                            ZStack {
                                Image(.dayBgCP)
                                    .resizable()
                                    .scaledToFit()
                                    
                                VStack(spacing: 5) {
                                    Text("Day \(day)")
                                        .font(.system(size: 22, weight: .regular))
                                        .foregroundStyle(.white)
                                        .textCase(.uppercase)
                                    
                                    Button {
                                        viewModel.claimNext()
                                    } label: {
                                        Image(.claimBtnCP)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: JGDeviceManager.shared.deviceType == .pad ? 70:38)
                                    }
                                    
                                }.padding(20)
                            }
                            .frame(width: 105, height: dayCellHeight)
                            .offset(x: day > 4 ? dayCellHeight/2:0)
                            .opacity(viewModel.isDayClaimed(day) ? 1: viewModel.isDayUnlocked(day) ? 0.7:0.3)
                            
                        }
                    }.frame(width: JGDeviceManager.shared.deviceType == .pad ? 800:350)
                }
            }.padding()
            
            VStack {
                HStack(alignment: .top) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(.backBtnCP)
                            .resizable()
                            .scaledToFit()
                            .frame(height: JGDeviceManager.shared.deviceType == .pad ? 100:50)
                    }
                    Spacer()
                    
                    JGCoinBg()
                }.padding([.horizontal, .top])
                
                Spacer()
            }
            
        }.background(
            ZStack {
                Image(.appBgCP)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        )
    }
}


#Preview {
    CPDailyRewardsView()
}
