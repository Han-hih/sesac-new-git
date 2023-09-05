//
//  FileManager+Extension.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/09/05.
//

import UIKit

extension UIViewController {
    
    func saveImageToDocument(fileName: String, image: UIImage) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("file save Error", error)
        }
    }
    
    func removeImageFromDocument(fileName: String) {
            //1. 도큐먼트 경로 찾기
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
            //2. 경로 설정(세부 경로, 이미지를 저장할 위치)
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            
            do {
                try FileManager.default.removeItem(at: fileURL)
            } catch {
                print(error)
            }
            
            
            
        }

    
}
