//
//  PhotoSubmission.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI
import UIKit
import FirebaseFirestore

struct PhotoSubmission: View {
    
    //Receive Data from UploadaMenu
    //https://stackoverflow.com/questions/65452602/how-can-i-pass-data-through-a-navigation-link-with-fetchedresults-and-coredata
    
    var restaurantname: String
    var restaurantaddress: String
    var restaurantdescription: String
    @State private var showingAlert = false
    //var email: String
    
    @State private var isShown: Bool = false
    @State private var image: Image = Image(systemName: "")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
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
                                                                "Description": restaurantdescription,
                                                                "Menu Categories": []
                                                            ]) { err in
                                                                if let err = err {
                                                                    print("Error adding document: \(err)")
                                                                } else {
                                                                    print("Document added with ID: \(ref!.documentID)")
                                                                }
                                                            }
                                                        } else {
                                                            //should block if restaurant already exist
                                                            showingAlert = true
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
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Restaurant already added"), message: Text(restaurantname + "'s menu have previously been added by other users"), dismissButton: .default(Text("Ok")))
                }
            }.sheet(isPresented: $isShown) {
                A(isShown: self.$isShown, myimage: self.$image, mysourceType: self.$sourceType)
        }.frame(width: geometry.size.width * 1)
        }
    
    }
}

struct A: UIViewControllerRepresentable{
    @Binding var isShown: Bool
    @Binding var myimage: Image
    @Binding var mysourceType: UIImagePickerController.SourceType
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<A>){
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<A>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mysourceType
        obj.delegate = context.coordinator
        return obj
    }
    func makeCoordinator() -> C {
        return C(isShown: $isShown, myimage: $myimage)
    }
}

class C: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @Binding var isShown: Bool
    @Binding var myimage: Image
    
    init(isShown: Binding<Bool>, myimage: Binding<Image>){
        _isShown = isShown
        _myimage = myimage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(image)
            myimage = Image.init(uiImage: image)
        }
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

