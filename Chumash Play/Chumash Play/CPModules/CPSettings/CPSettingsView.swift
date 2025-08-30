//
//  CPSettingsView.swift
//  Chumash Play
//
//

import SwiftUI

struct CPSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
        @StateObject var settingsVM = JGSettingsViewModel()
        var body: some View {
            ZStack {
                
                VStack {
                    
                    ZStack {
                        
                        Image(.settingsBgCP)
                            .resizable()
                            .scaledToFit()
                           // .frame(height: JGDeviceManager.shared.deviceType == .pad ? 88:400)
                        
                        VStack(spacing: 20) {
                            
                            Button {
                                withAnimation {
                                    settingsVM.soundEnabled.toggle()
                                }
                            } label: {
                                Image(settingsVM.soundEnabled ? .onCP:.offCP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: JGDeviceManager.shared.deviceType == .pad ? 80:41)
                            }
                            
                            
                            Image(.englishBtnCP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: JGDeviceManager.shared.deviceType == .pad ? 88:44)
                            
                        }.padding(.top, 32)
                    }.padding()
                    
                }
                
                VStack {
                    HStack {
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
                        
                    }.padding()
                    Spacer()
                    
                    
                    
                }
            }.frame(maxWidth: .infinity)
                .background(
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
    CPSettingsView()
}
