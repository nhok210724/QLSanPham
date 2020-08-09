//
//  ViewController.swift
//  QLSanPham
//
//  Created by Le Van Nghia on 7/30/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import UIKit

class NewSanPhamViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var lblNameSp: UITextField!
    @IBOutlet weak var imageSanPham: UIImageView!
    @IBOutlet weak var lblSoLuong: UITextField!
    @IBOutlet weak var lblDonGia: UITextField!
    var newSanPham = SanPham()
    var sp: SanPham?
    @IBAction func btnSave(_ sender: Any) {
        print("button on Save")
        if(newSanPham.imageName == nil || newSanPham.nameSP?.count == 0 || newSanPham.soLuong?.count == 0 || newSanPham.donGia?.count == 0){
            let alerController = UIAlertController(title: "Thong Bao", message: "Vui long nhap day du thong tin", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) {(action) in }
            alerController.addAction(ok)
            self.present(alerController, animated: true, completion: nil)
        }
        else{
            sanPhams.append(newSanPham)
            navigationController?.popViewController(animated: true)
            let main = self.navigationController?.topViewController as? MainViewController
            main?.tableView?.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapTapGesTureToImage = UITapGestureRecognizer(target: self, action: #selector(tapToImageView(sender:)))
        tapTapGesTureToImage.numberOfTapsRequired = 1
        imageSanPham?.isUserInteractionEnabled = true
        imageSanPham?.addGestureRecognizer(tapTapGesTureToImage)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func tapToImageView(sender:UITapGestureRecognizer){
        print("tap gesture")
        let pickerControll = UIImagePickerController()
        pickerControll.delegate = self
        pickerControll.allowsEditing = true
        pickerControll.sourceType = .photoLibrary
        self.present(pickerControll, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImge = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Do not Image")
        }
        imageSanPham.image = selectedImge
        dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return press")
        lblNameSp.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        newSanPham.nameSP = lblNameSp.text ?? ""
        newSanPham.donGia = lblDonGia.text ?? ""
        newSanPham.soLuong = lblSoLuong.text ?? ""
    }
    
}

