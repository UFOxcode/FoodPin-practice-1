//
//  AaTableViewController.swift
//  FoodPin practice 1
//
//  Created by UFO Xcode on 2019/12/4.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import UIKit

class AaTableViewController: UITableViewController {

    var dinnersName = ["KFC", "麥當勞","Pizza","AAA","BBB","CCC","DDD","EEE","FFF","GGG","HHH","III","JJJ","KKK","LLL"]
    
    var markOrNot = Array(repeating: false, count: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        //ipad 用的
//        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dinnersName.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ACell", for: indexPath) as! InOneTableViewCell

        // Configure the cell...
        cell.Label1.text = dinnersName[indexPath.row]
        cell.aImage.image = UIImage(named: dinnersName[indexPath.row])
        
//        if markOrNot[indexPath.row] {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        cell.accessoryType = markOrNot [indexPath.row] ? .checkmark : .none
        
        
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (dinnersName[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark

        //        markOrNot[indexPath.row] = true
        switch markOrNot[indexPath.row] {
        case true :
            markOrNot[indexPath.row] = false
        case false :
            markOrNot[indexPath.row] = true
            
            
//        default:
//            print(" some thing not right")
        }
        
        tableView.reloadData()
        
//        cell?.accessoryType = .detailButton
//        cell?.accessoryType = .detailDisclosureButton
//        cell?.accessoryType = .disclosureIndicator
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    
    // 自動帶 刪除
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            dinnersName.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
////        } else if editingStyle == .insert {
////             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
   
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "要殺掉了") { (action, sourceView, completionHandler) in
            self.dinnersName.remove(at: indexPath.row)
            self.markOrNot.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        
            completionHandler(true)
            
        }
    
        let shareAction = UIContextualAction(style: .normal, title: "分享") { (action, sourceView, completionHandler) in
            let dText = " 加入》〉" + self.dinnersName[indexPath.row] + "《〈前面是 array的row 值！！ "
            let activityController = UIActivityViewController(activityItems: [dText], applicationActivities: nil)
            
           
            
            
            
            self.present(activityController,animated: true, completion: nil)
            completionHandler(true)
        }
         // 加顏色 及 Icon
        deleteAction.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//        deleteAction.image = UIImage(named: "XYZ")
        shareAction.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        
        
        let swipeC = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        
        return swipeC
    
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
