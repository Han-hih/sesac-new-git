//
//  realm.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/09/04.
//

import Foundation
import RealmSwift

class BookList: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var bookTitle: String
    @Persisted var bookThumb: String
    @Persisted var bookAuthor: String
    
    convenience init(bookTitle: String, bookThumb: String, bookAuthor: String) {
        self.init()
        
        self.bookTitle = bookTitle
        self.bookThumb = bookThumb
        self.bookAuthor = bookAuthor
    }
    
}
 


