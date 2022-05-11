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
//    @State var email: String = ""
    
    @State private var showToast = false

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

                Group {
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
                    
                    Text("Restaurant Description")
                        .font(Font.system(size: geometry.size.width*0.05))
                        .bold()
                        .padding(.top, 15)
                
                    TextField("", text: $restaurantdescription)
                        .padding(13)
                        //.background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.5)))
      
                    /*
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
                     */
                    
                }
                
                //Spacer()
                //Pass Data to PhotoSubmission. API call is current made here but eventually should be shifted to be made together with menu category information
                //https://stackoverflow.com/questions/65452602/how-can-i-pass-data-through-a-navigation-link-with-fetchedresults-and-coredata
                HStack{
                    Spacer()
                    NavigationLink(destination: PhotoSubmission(restaurantname: restaurantname, restaurantaddress: restaurantaddress, restaurantdescription: restaurantdescription), label: {
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
