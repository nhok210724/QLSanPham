//
//  InputKho.swift
//  QLSanPham
//
//  Created by Phan Tien Nhan on 8/9/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import UIKit

class InputKho: UIViewController,UINavigationControllerDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate {
    
    //MARK: Connecting Object
    @IBOutlet weak var tfMa: UITextField!
    
    @IBOutlet weak var tfLoai: UITextField!
    
    @IBOutlet weak var imageKho: UIImageView!
    
    @IBOutlet weak var barSave: UIBarButtonItem!
    
    @IBOutlet weak var itemBar: UINavigationItem!
    
    
    //MARK: Kho
    var kho:Kho?
    public var ListKho = [Kho]()
    
    
    //MARK: View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfMa.delegate = self
        tfLoai.delegate = self
        // Do any additional setup after loading the view.
        
        checkBarSave()
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    
    //MARK: OVERRIDE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfMa.resignFirstResponder()
        tfLoai.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        checkBarSave()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        barSave.isEnabled = false
    }
    
    @IBAction func PickImage(_ sender: UITapGestureRecognizer) {
        //Creat Object of IMagepickerController
        let imagepick = UIImagePickerController()
        //config the imgController
        imagepick.sourceType = .photoLibrary
        //Delegation of imagePicker
        imagepick.delegate=self
        //Present the image picker
        present(imagepick, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  else{
            fatalError("Can Not Get The Image")
        }
        imageKho.image=selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func eventSave(_ sender: UIBarButtonItem) {
        let ma = tfMa.text
        let loai = tfLoai.text
        
        itemBar.title=ma! + " -- " + loai!
        
        kho = Kho(ma: ma!, Loai: loai!, img: imageKho.image!)
        ListKho.append(kho!)
        addToKho()
        
        
        
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: SetEvent
    func checkBarSave(){
        let ma = tfMa.text
        let loai = tfLoai.text
        if loai!.isEmpty {
            if ma!.isEmpty {
                barSave.isEnabled = false
            }
        }else{
            barSave.isEnabled = true
        }
        
    }
    
    func addToKho(){
        
        // create the alert
        let alert = UIAlertController(title: "Thong Bao", message: "Them Thanh Cong", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
}
