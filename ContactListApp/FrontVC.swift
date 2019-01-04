//
//  FrontVC.swift
//  ContactListApp
//
//  Created by Asfand Hafeez on 04/01/2019.
//  Copyright © 2019 Asfand Hafeez. All rights reserved.
//

import UIKit


class FrontVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
   

    var dataArray = [TableViewData]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       dataArray = [TableViewData(title: "Zain", SelectionState: .deselected),
        TableViewData(title: "Asfand", SelectionState: .deselected),
        TableViewData(title: "Mujahid", SelectionState:.deselected),
        TableViewData(title: "Fahad", SelectionState: .deselected)]
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func OnClickList(_ sender: Any) {
//        tableView.setEditing(true, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell {
        cell.textLabel?.text = dataArray[indexPath.row].title
            cell.configureCell(index: indexPath.row, type: dataArray[indexPath.row].SelectionState)
        return cell
        } else  {
            return CustomCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell{
            if dataArray[indexPath.row].SelectionState == .selected{
                dataArray[indexPath.row].SelectionState = .deselected
            }else{
                dataArray[indexPath.row].SelectionState = .selected
            }
        }
        self.tableView.reloadData()
    }
}
class CustomCell: UITableViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func configureCell(index:Int , type: SelectionState) {
        if type == SelectionState.selected {
            cellImageView.image = UIImage(named: "check")
            
        }else {
            cellImageView.image = UIImage(named: "dots")
        }
        
    }
    func setUpView() {
//        layer.backgroundColor = UIColor.lightGray.cgColor
//        layer.cornerRadius = 10
//        self.clipsToBounds = true
        
        
    }
}

enum SelectionState {
    case selected
    case deselected
}



struct TableViewData  {
    let title : String
    var SelectionState : SelectionState
}
