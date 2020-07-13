//
//  ViewController.swift
//  QLMonAn
//
//  Created by Phan Tien Nhan on 6/21/20.
//  Copyright © 2020 Phan Tien Nhan. All rights reserved.
//

import UIKit

class MealDetailController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
//MARK:Properties
    var meal: Meal?
    
    @IBOutlet weak var tfMealName: UITextField!
    
    @IBOutlet weak var savebtn: UIBarButtonItem!
    
    @IBOutlet weak var ImageMeal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfMealName.delegate = self
    }
    //MARK: Delegation Functions of TextField
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            tfMealName.resignFirstResponder()
            return true
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
           // lbName.text=tfMealName.text
        }
    //MARK: Actions
    
    @IBAction func goToMap(_ sender: UIButton) {
        //lbName.text=tfMealName.text
    }
    @IBAction func TouchImage(_ sender: UITapGestureRecognizer) {
        //HIDE the Keyboard
        tfMealName.resignFirstResponder()
        
        //Creat Object of IMagepickerController
        let imgPicker = UIImagePickerController()
        //config the imgController
        imgPicker.sourceType = .photoLibrary
        //Delegation of imagePicker
        imgPicker.delegate=self
        //Present the image picker
        present(imgPicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  else{
            fatalError("Can Not Get The Image")
        }
        ImageMeal.image=selectedImage
        dismiss(animated: true, completion: nil)
    }
    //MARK: For navigation controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

