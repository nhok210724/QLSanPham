//
//  DatabaseAcess.swift
//  QLSanPham
//
//  Created by Le Van Nghia on 8/9/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import Foundation
import UIKit
import os.log

class DatabaseAcess {
    //Mark: Properties
    let dPath: String
    let DB_NAME: String = "SanPham.sqlite"
    let db: FMDatabase?
    
    //Mark: Table properties
    let TABLE_NAME:String = "sanPham"
    let TABLE_ID:String = "_id"
    let MEAL_NAME:String = "name"
    let MEAL_IMAGE:String = "image"
    let MEAL_SoLuong:String = "soLuong"
    let MEAL_DonGia:String = "donGia"
    
    //Mark:Constructor
    init() {
        let directories:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory,.allDomainsMask,true)
        dPath = directories[0] + "/" + DB_NAME
        db = FMDatabase(path: dPath)
        if db == nil{
            os_log("Can not create database")
        }
        else {
            os_log("Failed")
        }
    }
    //Mark: Primities
    func create() -> Bool {
        var ok : Bool = false
        if db != nil {
            let sql = "CREATE TABLE " + TABLE_NAME + "( "
                + TABLE_ID + " INTEGER PRIMARY KEY AUTOINCREMENT," + MEAL_NAME + "TEXT, " + MEAL_IMAGE + "TEXT, " + MEAL_SoLuong + "TEXT," + MEAL_DonGia + "TEXT)"
            
            if db!.executeStatements(sql){
                ok = true
                os_log("Table is create")
            }
            else
            {
                os_log("Can not create the table !")
            }
        }
        else {
            os_log("Database is null !")
        }
        return ok
    }
    func open() -> Bool {
        var Ok: Bool = false
        if db != nil{
            if db!.open(){
                Ok = true
                os_log("the database is opened!")
            }
            else{
                print("can not open the Database: \(db!.lastErrorMessage())")
            }
        }
        else{
            os_log("Database is nil!")
        }
        return Ok
    }
    
    func Close() {
        if db != nil{
            db!.close()
        }
    }
    func delete(sanPham:SanPham){
        if db != nil {
            let sql = "DELETE FROM \(TABLE_NAME) WHERE \(MEAL_NAME) = ? AND \(MEAL_SoLuong) = ?"
            do {
                try db!.executeUpdate(sql, values: [sanPham.nameSP, sanPham.soLuong])
                os_log("the SanPham is delete")
            }
            catch{
                os_log("fail to delete the San Pham")
            }
        }
        else{
            os_log("Database is nil!")
        }
    }
    /*func ReadSanPhamList(sanPham:inout [SanPham]){
        if db != nil{
            var results: FMResultSet?
            let sql = "SELECT * FROM \(TABLE_NAME)"
            
            do{
                results = try db!.executeQuery(sql, values: nil)
            }
            catch{
                print("fail to read data: \(error.localizedDescription)")
            }
            if results != nil {
                while (results?.next())!{
                    let nameSanPham = results!.string(forColumn: MEAL_NAME) ?? ""
                    let stringImage = results!.int(forColumn: MEAL_IMAGE)
                    let SoLuong = results!.string(forColumn:MEAL_SoLuong )
                    let donGia = results!.string(forColumn: MEAL_DonGia)
                    let dataimage: Data = Data(base64Encoded: stringImage, options: .ignoreMetacharacters)!
                    let sanPhamImage = UIImage(data: dataimage)
                    let sanpham = SanPham(imageName: stringImage, nameSP: nameSanPham, soLuong: SoLuong, donGia: donGia)
                    
                }
            }
        }
    }*/
}
