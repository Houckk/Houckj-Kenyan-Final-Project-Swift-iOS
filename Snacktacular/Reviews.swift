//
//  Reviews.swift
//  Snacktacular
//
//  Created by Kenyan Houck on 4/15/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import Foundation
import Firebase

class Reviews {
    var reviewArray: [Review] = []
    var db: Firestore!
    
    init(){
        db = Firestore.firestore()
    }
    
    
    func loadData(spotName: String, completed: @escaping()-> ())
    {
        print("in load data")
        /*guard spot.documentID != "" else {
            print("in guard statement")
            return
        }*/
        db.collection("reviews").whereField("spot", isEqualTo: spotName).addSnapshotListener { (querySnapshot, error) in
            print("in load data 2")
            guard error == nil else {
                print("**** ERROR: Adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.reviewArray = []
            // there are querySnapshot!.documents.count documents in the spots snapshot
            for document in querySnapshot!.documents {
                print("in for loop")
                let review = Review(dictionary: document.data())
                review.documentID = document.documentID
                self.reviewArray.append(review)
            }
            completed()
        }
    }

}
