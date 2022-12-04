////
////  ViewController.swift
////  Worterbuch
////
////  Created by NasrinJafari(Personal) on 03.11.22.
////
//
//import Foundation
//import UIKit
//import CoreData
//
//class ViewController: UIViewController {
//    // Properties
//    var verbs:[Verbs]?
//
//    var newVerbs:[verbsInformationsModel]? {
//        didSet {
//            // Remove all Previous Records
//            DataController.deleteAllVerbs()
//            // Add the new spots to Core Data Context
//            self.addNewShowsToCoreData(self.newVerbs!)
//            // Save them to Core Data
//            DataController.saveContext()
//            // Reload the tableView
//            self.reloadTableView()
//        }
//    }
//
//    // Views
//    var tableView: UITableView = {
//        let v = UITableView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        return v
//    }()
//
//    lazy var updateButton: UIButton = {
//        let b = UIButton()
//        b.translatesAutoresizingMaskIntoConstraints = false
//        b.setTitle("Update", for: .normal)
//        b.setTitleColor(.black, for: .normal)
//        b.isEnabled = true
//        b.addTarget(self, action: #selector(getDataFromServer), for: .touchUpInside)
//        return b
//    }()
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.verbs = DataController.getAllVerbs()
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
////        self.tableView.delegate = self
////        self.tableView.dataSource = self
////        self.tableView.register(ShowCell.self, forCellReuseIdentifier: ShowCell.identifier)
////
////        self.layoutSubViews()
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    //TableView -
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DataController.getAllVerbs().count
//    }
//
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        // 100
////        return ShowCell.height()
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = self.tableView.dequeueReusableCell(withIdentifier: ShowCell.identifier) as! ShowCell
////
////        self.verbs = DataController.getAllVerbs()
////
////        if verbs?.count != 0 {
////            if let name = verbs?[indexPath.row].ver {
////                cell.nameLabel.text = name
////            }
////
////            if let descriptionInfo = Shows?[indexPath.row].info {
////                cell.descriptionLabel.text = descriptionInfo
////            }
////        } else {
////            print("No shows bros")
////        }
////
////
////        return cell
////    }
//
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        // Show the contents
////        print(Shows?[indexPath.row] ?? "No Data For this Row.")
////
////    }
//
//    func reloadTableView() {
//        DispatchQueue.main.async {
//         self.tableView.reloadData()
//        }
//    }
//
//
//    func layoutSubViews() {
//        let guide = self.view.safeAreaLayoutGuide
//        let spacing: CGFloat = 8
//
//        self.view.addSubview(tableView)
//        self.view.addSubview(updateButton)
//
//        updateButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: spacing).isActive = true
//        updateButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: spacing * 4).isActive = true
//        updateButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: spacing * -4).isActive = true
//        updateButton.heightAnchor.constraint(equalToConstant: 55.0).isActive = true
//
//        tableView.topAnchor.constraint(equalTo: updateButton.bottomAnchor, constant: spacing).isActive = true
//        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: spacing).isActive = true
//    }
//
//
//    @objc func getDataFromServer() {
//        print("Updating...")
//        let urlPath = "words.json"
//        guard let url = URL(string: urlPath) else {return}
//
//        let task = URLSession.shared.dataTask(with: url) {
//            (data, response, error) in
//                guard let dataResponse = data, error == nil else {
//                        print(error?.localizedDescription ?? "Response Error")
//                return }
//
//            do {
//                self.newVerbs = try JSONDecoder().decode([verbsInformationsModel].self, from: dataResponse)
//            } catch {
//                print(error)
//            }
//
//        }
//
//        task.resume()
//    }
//
//
//
//
//    func addNewShowsToCoreData(_ verbs: [verbsInformationsModel]) {
//
//        for verb in verbs {
//            let entity = NSEntityDescription.entity(forEntityName: "Verbs", in: DataController.getContext())
//            let newVerb = NSManagedObject(entity: entity!, insertInto: DataController.getContext())
//
//            // Create a unique ID for the Show.
//            let uuid = UUID()
//            // Set the data to the entity
//            newVerb.setValue(verb.verb, forKey: "verb")
//            newVerb.setValue(verb.tenses, forKey: "tenses")
//            newVerb.setValue(verb.pasts, forKey: "pasts")
//            newVerb.setValue(verb.explanation, forKey: "explanation")
//            newVerb.setValue(verb.examples, forKey: "examples")
//            newVerb.setValue(verb.id, forKey: "id")
//            newVerb.setValue(uuid.uuidString, forKey: "uuid")
//        }
//
//    }
//
//
//
//}
