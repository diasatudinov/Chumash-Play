//
//  JGCoinBg.swift
//  Chumash Play
//
//


import SwiftUI

struct JGCoinBg: View {
    @StateObject var user = JGUser.shared
    var height: CGFloat = JGDeviceManager.shared.deviceType == .pad ? 100:50
    var body: some View {
        ZStack {
            Image(.coinsBgCP)
                .resizable()
                .scaledToFit()
            
            Text("\(user.money)")
                .font(.system(size: JGDeviceManager.shared.deviceType == .pad ? 45:25, weight: .black))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .offset(x: -15)
            
            
            
        }.frame(height: height)
        
    }
}

#Preview {
    JGCoinBg()
}
