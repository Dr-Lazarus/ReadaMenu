//
//  UploadaMenu.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI

struct UploadaMenu: View {
    
    @State var restaurantname: String = ""
    @State var restaurantaddress: String = ""
    @State var email: String = ""

    var body: some View {
        GeometryReader { geometry in // to scale according to screen size
            VStack (alignment:.leading){
            
                Text("Please help us to fill up the following details")
                    .font(Font.system(size: geometry.size.width*0.081))
                    .bold()
                    .multilineTextAlignment(.center)
                    //.padding()
                
                HStack{
                    Spacer()
                    Image("note-taking")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.83)
                    Spacer()
                }

                Text("Name of Restaurant")
                    .font(Font.system(size: geometry.size.width*0.05))
                    .bold()
                
                TextField("", text: $restaurantname)
                    .padding(13)
                    .font(Font.system(size: geometry.size.width*0.05))
                    //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
                
                Text("Restaurant Address")
                    .font(Font.system(size: geometry.size.width*0.05))
                    .bold()
                    .padding(.top, 15)
            
                TextField("", text: $restaurantaddress)
                    .padding(13)
                    //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
  
                Text("Email (Optional)")
                    .font(Font.system(size: geometry.size.width*0.05))
                    .bold()
                    .padding(.top, 15)
                    
                /*
                Text("Please provide your email if you are open to verifying the restaurant once it is processed. Don't worry, we won't spam your email!")
                    .font(Font.system(size: geometry.size.width*0.04))
                    .fontWeight(.semibold)
                    //.padding(.top,0.001)
                 */
                    
                TextField("", text: $email)
                    .padding(13)
                    //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
                    .padding([.vertical])
                
                //Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: PhotoSubmission(), label: {
                        Text("Next")
                            .font(Font.system(size: geometry.size.width*0.06))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black).padding(15).padding([.horizontal])
                            .background(Rectangle().cornerRadius(20).foregroundColor(.yellow))
                    })
                }
                                
            }
            .padding()
            .frame(width: geometry.size.width * 1)
            .navigationTitle("Upload a Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct UploadaMenu_Previews: PreviewProvider {
    static var previews: some View {
        UploadaMenu()
    }
}
