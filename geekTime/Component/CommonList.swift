//
//  CommonList.swift
//  geekTime
//
//  Created by lsaac on 2022/3/7.
//

import Foundation
import UIKit

class CommonListCell<ItemType>:UITableViewCell{
    var item:ItemType?
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol CommonListDelegate:AnyObject{
    func didSelectedItem<Item>(_ item:Item)
}



class CommonList<ItemType,CellType: CommonListCell<ItemType>>: UIView,UITableViewDelegate,UITableViewDataSource {
  
    
    
    var tableView:UITableView
    
    var items: [ItemType] = []{
        didSet {
            self.tableView.reloadData()
        }
    }
    
    weak var delegate:CommonListDelegate?
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero,style: .plain)
        super.init(frame: frame)
        self.setupViews()
    }
    
    
    func setupViews(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CellType.self, forCellReuseIdentifier: "cellId")
//        tableView.register(ProductCell(), forCellReuseIdentifier: "tableView")
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :CellType? = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CellType
        if cell == nil{
            cell = CellType(style: .subtitle, reuseIdentifier: "cellId")
        }
        cell?.item = items[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectedItem(items[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
