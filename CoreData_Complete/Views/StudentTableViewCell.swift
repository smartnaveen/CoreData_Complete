//
//  StudentTableViewCell.swift
//  CoreData_Complete
//
//  Created by Mr. Naveen Kumar on 13/04/21.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    static let shared = StudentTableViewCell()
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentAddress: UILabel!
    @IBOutlet weak var studentCity: UILabel!
    @IBOutlet weak var studentMobile: UILabel!
    
    let cellIdentifier = "StueentCell"
    
    var updateStudentProfile: Student? {
        didSet {
            studentName.text = updateStudentProfile?.name
            studentAddress.text = updateStudentProfile?.address
            studentCity.text = updateStudentProfile?.city
            studentMobile.text = updateStudentProfile?.mobile
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        studentName.text = "naveen"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func nib() -> UINib {
        return UINib(nibName: "StudentTableViewCell", bundle: nil)
    }
    
}
