//
//  PhotoSubmission.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI
import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage

struct PhotoSubmission: View {
    
    //Receive Data from UploadaMenu
    //https://stackoverflow.com/questions/65452602/how-can-i-pass-data-through-a-navigation-link-with-fetchedresults-and-coredata
    
    var restaurantname: String
    var restaurantaddress: String
    var restaurantdescription: String
    @State private var showingRestaurantExistAlert = false
    @State private var showingSuccessAlert = false
    //var email: String
    
    @State private var isShown: Bool = false
    @State private var image: Image = Image(systemName: "")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var imageData: Data = Data()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                image.resizable().frame(width: 240, height: 320).cornerRadius(5)
                Spacer()
                Button(action:{
                    self.isShown.toggle()
                    self.sourceType = .camera
                }) {
                    Text("Camera")
                        .font(Font.system(size: geometry.size.width*0.075))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black).padding(25).padding([.horizontal], 100)
                        .background(Rectangle().cornerRadius(10).foregroundColor(.yellow))
                        .padding(.bottom)
                }
                Button(action:{
                    self.isShown.toggle()
                    self.sourceType = .photoLibrary
                }) {
                    Text("Gallery")
                        .font(Font.system(size: geometry.size.width*0.075))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black).padding(25).padding([.horizontal], 100)
                        .background(Rectangle().cornerRadius(10).foregroundColor(.yellow))
                        .padding(.bottom)
                }
                Button(action: {
                    let db = Firestore.firestore()
                    let storageRef = Storage.storage().reference().child(restaurantname)
                                        
                                            db.collection("Restaurant").whereField("Name", isEqualTo: restaurantname)
                                                .getDocuments() { (querySnapshot, err) in
                                                    if let err = err {
                                                        print("Error getting documents: \(err)")
                                                    } else {
                                                        if querySnapshot!.documents.isEmpty {
                                                            if (!isShown && !imageData.isEmpty) {
                                                                _ = storageRef.putData(imageData, metadata: nil) { [self] (metadata, error) in
                                                                  // You can also access to download URL after upload.
                                                                    storageRef.downloadURL { (url, error) in
                                                                    //create new entry
                                                                    var ref: DocumentReference? = nil
                                                                    ref = db.collection("Restaurant").addDocument(data: [
                                                                        "Name": restaurantname,
                                                                        "Location": restaurantaddress,
                                                                        "Description": restaurantdescription,
                                                                        "Menu Categories": [],
                                                                        "ImageURL": url?.absoluteString ?? ""
                                                                    ]) { err in
                                                                        if let err = err {
                                                                            print("Error adding document: \(err)")
                                                                        } else {
                                                                            print("Document added with ID: \(ref!.documentID)")
                                                                            showingSuccessAlert = true
                                                                        }
                                                                    }
                                                                  }
                                                                }
                                                            }
                                                            
                                                        } else {
                                                            //should block if restaurant already exist
                                                            showingRestaurantExistAlert = true
                                                        }
                                                    }
                                            }
                }) {
                    Text("Upload")
                        .font(Font.system(size: geometry.size.width*0.075))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black).padding(25).padding([.horizontal], 100)
                        .background(Rectangle().cornerRadius(10).foregroundColor(.blue.opacity(0.6)))
                        .padding(.bottom)
                }.alert(isPresented: $showingRestaurantExistAlert) {
                    Alert(title: Text("Restaurant already added"), message: Text(restaurantname.capitalizingFirstLetter() + "'s menu have previously been added by other users"), dismissButton: .default(Text("Ok")))
                }.toast(message: restaurantname.capitalizingFirstLetter() + "'s menu have been successfully uploaded",
                           isShowing: $showingSuccessAlert,
                           duration: Toast.short)

            }.sheet(isPresented: $isShown) {
                A(isShown: self.$isShown, myimage: self.$image, mysourceType: self.$sourceType, imageData: self.$imageData)
        }.frame(width: geometry.size.width * 1)
        }
    }
}

struct A: UIViewControllerRepresentable{
    @Binding var isShown: Bool
    @Binding var myimage: Image
    @Binding var mysourceType: UIImagePickerController.SourceType
    @Binding var imageData: Data
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<A>){
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<A>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mysourceType
        obj.delegate = context.coordinator
        return obj
    }
    func makeCoordinator() -> C {
        return C(isShown: $isShown, myimage: $myimage, imageData: $imageData)
    }
}

class C: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @Binding var isShown: Bool
    @Binding var myimage: Image
    @Binding var imageData: Data
    
    init(isShown: Binding<Bool>, myimage: Binding<Image>, imageData: Binding<Data>){
        _isShown = isShown
        _myimage = myimage
        _imageData = imageData
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(image)
            myimage = Image.init(uiImage: image)
            imageData = image.jpegData(compressionQuality: 0.8)!
        }
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
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

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
