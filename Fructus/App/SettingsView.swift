//
//  SettingsView.swift
//  Fructus
//
//  Created by Dzmitry Bladyka on 28.03.23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isOnboarding") var isOnboarding = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // Section 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essentials nutrients, including pottasium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                        }
                    }
                    
                    // Section 2
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ) {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    // Section 3
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ) {
                        SettingsRowView(name: "Developer", content: "Dzmitry Distortion")
                        SettingsRowView(name: "Designer", content: "also Dzmitry DIstortion")
                        SettingsRowView(name: "Website", linkLabel: "db Homepage", linkDestination: "zwk.com")
                        SettingsRowView(name: "Telegram", linkLabel: "@zwk", linkDestination: "tg.me/zwk")
                        SettingsRowView(name: "Compatibility", content: "iOS 15")
                        SettingsRowView(name: "Version", content: "1.1.0")
                        SettingsRowView(name: "SwiftUI", content: "4.0")
                    }
                    
                }
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems (
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}