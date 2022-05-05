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
    @State var email: String = ""
    
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
                }
                
                //Spacer()
                //Pass Data to PhotoSubmission. API call is current made here but eventually should be shifted to be made together with menu category information
                //https://stackoverflow.com/questions/65452602/how-can-i-pass-data-through-a-navigation-link-with-fetchedresults-and-coredata
                HStack{
                    Spacer()
                    NavigationLink(destination: PhotoSubmission(restaurantname: restaurantname, restaurantaddress: restaurantaddress, restaurantdescription: restaurantdescription, email: email), label: {
                        Text("Next")
                            .font(Font.system(size: geometry.size.width*0.06))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black).padding(15).padding([.horizontal])
                            .background(Rectangle().cornerRadius(20).foregroundColor(.yellow))
                    }).simultaneousGesture(TapGesture().onEnded{
                    
                        let db = Firestore.firestore()
                    
                        db.collection("Restaurant").whereField("Name", isEqualTo: restaurantname)
                            .getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    if querySnapshot!.documents.isEmpty {
                                        //create new entry
                                        var ref: DocumentReference? = nil
                                        ref = db.collection("Restaurant").addDocument(data: [
                                            "Name": restaurantname,
                                            "Location": restaurantaddress,
                                            "Description": restaurantdescription
                                        ]) { err in
                                            if let err = err {
                                                print("Error adding document: \(err)")
                                            } else {
                                                print("Document added with ID: \(ref!.documentID)")
                                            }
                                        }
                                    } else {
                                        //should block if restaurant already exist
                                    }
                                }
                        }


                        
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

struct Toast: ViewModifier {
  // these correspond to Android values f
  // or DURATION_SHORT and DURATION_LONG
  static let short: TimeInterval = 2
  static let long: TimeInterval = 3.5

  let message: String
  @Binding var isShowing: Bool
  let config: Config

  func body(content: Content) -> some View {
    ZStack {
      content
      toastView
    }
  }

  private var toastView: some View {
    VStack {
      Spacer()
      if isShowing {
        Group {
          Text(message)
            .multilineTextAlignment(.center)
            .foregroundColor(config.textColor)
            .font(config.font)
            .padding(8)
        }
        .background(config.backgroundColor)
        .cornerRadius(8)
        .onTapGesture {
          isShowing = false
        }
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
            isShowing = false
          }
        }
      }
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 18)
    .animation(config.animation, value: isShowing)
    .transition(config.transition)
  }

  struct Config {
    let textColor: Color
    let font: Font
    let backgroundColor: Color
    let duration: TimeInterval
    let transition: AnyTransition
    let animation: Animation

    init(textColor: Color = .white,
         font: Font = .system(size: 14),
         backgroundColor: Color = .black.opacity(0.588),
         duration: TimeInterval = Toast.short,
         transition: AnyTransition = .opacity,
         animation: Animation = .linear(duration: 0.3)) {
      self.textColor = textColor
      self.font = font
      self.backgroundColor = backgroundColor
      self.duration = duration
      self.transition = transition
      self.animation = animation
    }
  }
}

extension View {
  func toast(message: String,
             isShowing: Binding<Bool>,
             config: Toast.Config) -> some View {
    self.modifier(Toast(message: message,
                        isShowing: isShowing,
                        config: config))
  }

  func toast(message: String,
             isShowing: Binding<Bool>,
             duration: TimeInterval) -> some View {
    self.modifier(Toast(message: message,
                        isShowing: isShowing,
                        config: .init(duration: duration)))
  }
}
