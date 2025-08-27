import SwiftUI

struct JGCoinBg: View {
    @StateObject var user = JGUser.shared
    var height: CGFloat = JGDeviceManager.shared.deviceType == .pad ? 100:50
    var body: some View {
        ZStack {
            Image(.coinsBgJG)
                .resizable()
                .scaledToFit()
            
            Text("\(user.money)")
                .font(.system(size: JGDeviceManager.shared.deviceType == .pad ? 45:25, weight: .black))
                .foregroundStyle(.white)
                .textCase(.uppercase)
            
            
            
        }.frame(height: height)
        
    }
}

#Preview {
    JGCoinBg()
}