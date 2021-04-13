//
//  DatabaseHelper.swift
//  CoreData_Complete
//
//  Created by Mr. Naveen Kumar on 13/04/21.
//

import Foundation
import UIKit
import CoreData

class DataBaseHelper: NSObject {
    static let shared = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    let entityName = "Student"
    
     // MARK:- Save Data in CoreData
    func saveData(studentModel: StudentModel) {
        let student = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context!) as? Student
        student?.name = studentModel.studentName
        student?.address = studentModel.studentAddress
        student?.city = studentModel.studentCity
        student?.mobile = studentModel.studentMobile
        
        do {
            try context?.save()
        } catch  {
         print("Error has occurr while saving data...")
        }
    }
    
     // MARK:- Fetch Data
    func fetchData() -> [Student] {
        var studentData = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        do {
           studentData = try context?.fetch(fetchRequest) as! [Student]
        } catch  {
            print("Error has occur whhen fetching data...")
        }
        return studentData
    }
    
     // MARK:- Update Data
    func updateData(studentModel: StudentModel, editIndex: Int) {
        let studentData = fetchData()
        studentData[editIndex].name = studentModel.studentName
        studentData[editIndex].address = studentModel.studentAddress
        studentData[editIndex].city = studentModel.studentCity
        studentData[editIndex].mobile = studentModel.studentMobile
        do {
            try context?.save()
        } catch  {
            print("Error occur while updating data...")
        }
    }
    
    
    // MARK:- Delete Data
    func deleteData(index: Int) -> [Student] {
        var studentData = fetchData()
        context?.delete(studentData[index])
        studentData.remove(at: index)
        
        do {
            try context?.save()
        } catch  {
            print("Error has occur when Deleting data...")
        }
        return studentData
    }
    
}
