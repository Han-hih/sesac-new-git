//
//  PracticeTableViewController.swift
//  tableviewPractice
//
//  Created by 황인호 on 2023/07/27.
//

import UIKit

class PracticeTableViewController: UITableViewController {

    let allList = ["공지사항", "실험실", "버전 정보"]
    let personalList = ["개인/보안", "알림", "멀티프로필"]
    let other = ["고객센터/도움말"]
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
        }
        override func numberOfSections(in tableView: UITableView) -> Int {
            
            return 3
            
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            if section == 0 {
                return "전체 설정"
            } else if section == 1 {
                return "개인 설정"
            } else {
                return "기타"
            }
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if section == 0 {
                return allList.count
            } else if section == 1 {
                return personalList.count
            } else {
                return other.count
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "setting")!
            
            if indexPath.section == 0 {
                cell.textLabel?.text = allList[indexPath.row]
                
            } else if indexPath.section == 1{
                cell.textLabel?.text = personalList[indexPath.row]
            } else {
                cell.textLabel?.text = other[indexPath.row]
            }
            
            return cell
        }
}
