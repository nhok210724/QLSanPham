//
//  MainViewController.swift
//  QLSanPham
//
//  Created by Le Van Nghia on 8/7/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sanPhams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SanPhamTableViewCell") as! SanPhamTableViewCell
        let sanpham:SanPham = sanPhams[indexPath.row]
        if(sanpham.image != nil ){
            cell.imageName?.image = sanpham.image
        }
        else{
            cell.imageName?.image = UIImage(named: sanpham.imageName!)
        }
        
        cell.nameSP?.text = sanpham.nameSP
        cell.soLuong?.text = sanpham.soLuong
        cell.donGia?.text = sanpham.donGia
        return cell
    }
    //delete and update
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let sanPham = sanPhams[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") {(action,indexPath) in self.deleteAction(sanPham: sanPham, indextPath: indexPath)}
        let editAction = UITableViewRowAction(style: .default, title: "Edit") {(action,indexPath) in self.updateAction(sanPham: sanPham, indextPath: indexPath)}
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .blue
        return [deleteAction,editAction]
    }
    private func updateAction(sanPham:SanPham,indextPath:IndexPath){
        let alert = UIAlertController(title: "Update", message: "Cap Nhap San Pham", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "save", style: .default) {(action) in guard let textField = alert.textFields?.first else{
                return
            }
            if let textToEdit = textField.text{
                if textToEdit.count == 0 {
                    return
                }
                sanPham.nameSP = textToEdit
                self.tableView?.reloadRows(at: [indextPath], with: .automatic)
            }
            else{
                return
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel ", style: .default)
        alert.addTextField()
        guard let textField = alert.textFields?.first else {
            return
        }
        textField.placeholder = "Nhap ten san pham"
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    private func deleteAction(sanPham:SanPham,indextPath:IndexPath){
        let alert = UIAlertController(title: "Delete", message: "Ban chac chan muon xoa san pham nay", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes", style: .default){(action) in sanPhams.remove(at: indextPath.row)
            self.tableView?.deleteRows(at: [indextPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}
