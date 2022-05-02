//
//  ThankYou.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI

struct ThankYou: View {
    var body: some View {
        GeometryReader { geometry in // to scale according to screen size
            VStack(alignment: .center) {
            
                Text("Thank You!")
                    .font(Font.system(size: geometry.size.width*0.1))
                    .fontWeight(.heavy)
                
                Image("thumbsup")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.6)
                    //.offset(x: 0, y: -30)
                
                VStack(alignment: .center) {
                    Text("Your photograph has been submitted successfully")
                        .font(Font.system(size: geometry.size.width*0.077))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                
                    //Spacer()
                
                    Text("Please help to review the menu once it is ready")
                        .font(Font.system(size: geometry.size.width*0.077))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    NavigationLink(destination: HomeScreen()){
                        Text("Return to Home")
                            .font(Font.system(size: geometry.size.width*0.075))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black).padding(25).padding([.horizontal], 40)
                            .background(Rectangle().cornerRadius(10).foregroundColor(.yellow))
                        //.offset(x: 0, y: -35)
                    }
                    Spacer()
                }
                
            }.padding()
            .frame(width: geometry.size.width * 1)
            .navigationTitle("Upload a Menu")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ThankYou_Previews: PreviewProvider {
    static var previews: some View {
        ThankYou()
    }
}
