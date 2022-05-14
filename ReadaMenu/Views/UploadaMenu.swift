//
//  UploadaMenu.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI
import FirebaseFirestore

struct UploadaMenu: View {

    @State var restaurantname: String = ""
    @State var restaurantaddress: String = ""
    @State var restaurantdescription: String = ""
    @State var isPresented: Bool = false
    @State private var showToast = false
    @State var nameExist: Bool = false

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
                    Image(decorative: "note-taking")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.83)
                        .accessibilityHidden(true)
                    Spacer()
                }

                Group {
                    Text("Restaurant Name (Required*)")
                        .font(Font.system(size: geometry.size.width*0.05))
                        .bold()
                    
                    TextField("", text: $restaurantname)
                        .padding(13)
                        .font(Font.system(size: geometry.size.width*0.05))
                        //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
                        .onChange(of: restaurantname) { newValue in
                            if newValue == "" {
                                self.nameExist = false
                            } else {
                                self.nameExist = true
                            }
                        }

                    
                    Text("Restaurant Address")
                        .font(Font.system(size: geometry.size.width*0.05))
                        .bold()
                        .padding(.top, 15)
                
                    TextField("", text: $restaurantaddress)
                        .padding(13)
                        //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
                    
                    Text("Restaurant Description")
                        .font(Font.system(size: geometry.size.width*0.05))
                        .bold()
                        .padding(.top, 15)
                
                    TextField("", text: $restaurantdescription)
                        .padding(13)
                        //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
                }
                
                HStack{
                    Spacer()
                    NavigationLink(destination: PhotoSubmission(restaurantname: restaurantname, restaurantaddress: restaurantaddress, restaurantdescription: restaurantdescription), label: {
                        Text("Next")
                            .font(Font.system(size: geometry.size.width*0.06))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black).padding(15).padding([.horizontal])
                            .background(Rectangle().cornerRadius(20).foregroundColor(.yellow))
                    }).disabled(!nameExist)
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
