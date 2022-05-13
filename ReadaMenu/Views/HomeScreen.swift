//
//  HomeScreen.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI

struct HomeScreen: View {
    @State var isPresented: Bool = false
    var body: some View { // to scale according to screen size
        NavigationView{
            GeometryReader { geometry in
                VStack(alignment: .center){

                    Image(decorative: "Read a menu")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                    
                    NavigationLink(destination: BrowseRestaurants()){
                        Text("Browse Restaurants")
                            .font(Font.system(size: geometry.size.width*0.075))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black).padding(25)
                            .background(Rectangle().cornerRadius(10).foregroundColor(.yellow))
                            .accessibilityLabel("Welcome to Read A Menu! Click here to browse restaurants")
                    }.padding()
            
                    NavigationLink(destination: UploadaMenu(), isActive: self.$isPresented, label:{
                        Text("Upload a Menu")
                            .font(Font.system(size: geometry.size.width*0.075))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black).padding(25).padding([.horizontal], 40)
                            .background(Rectangle().cornerRadius(10).foregroundColor(.yellow))
                            .accessibilityLabel("Click here to upload a menu")
                    }).isDetailLink(false)
                    Spacer()
             
                }
                .padding(10)
                .offset(x: 0, y: -75)
                .frame(width: geometry.size.width * 1)
                .navigationBarBackButtonHidden(true)
            }
        }.environment(\.rootPresentationMode, self.$isPresented)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(isPresented: true)
    }
}

struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

typealias RootPresentationMode = Bool

extension RootPresentationMode {
    
    public mutating func dismiss() {
        self.toggle()
    }
}
