//
//  ViewController.swift
//  CareDataDemo
//
//  Created by Fernando on 16/02/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Person]?
    var families: [Family]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addPerson()
        fetchPeople()
        
//        relationshipDemo()
        fetchFamily()
        
        for family in families ?? [] {
            // Iterate through each person in the family
            for person in family.people ?? [] {
                print("Person in family \(family.name ?? "Unknown"): \((person as? Person)?.name ?? "Unknown")")
            }
        }
        
        print("1602 \(items![0].name)")
        print("1602 families \(families![0].people)")
    }
    
    func relationshipDemo() {
        
        let family = Family(context: context)
        family.name = "Abc Family"
        
        let person = Person(context: context)
        person.name = "Bart"
        
        family.addToPeople(person)
        
        do {
            try context.save()
        } catch {
            
        }
        
    }
    
    func addPerson() {
        let newPerson = Person(context: self.context)
        newPerson.name = "Fernando"
        newPerson.age = 23
        newPerson.gender = "Male"
        
        do {
            try self.context.save()
        } catch {
            
        }
    }

    func fetchPeople() {
        
        do {
            let req = Person.fetchRequest() as NSFetchRequest<Person>
            
//            let pred = NSPredicate(format: "name CONTAINS %@", "Fernando")
//            req.predicate = pred
            
//            let sort = NSSortDescriptor(key: "name", ascending: true)
//            req.sortDescriptors = [sort]
            
            self.items = try context.fetch(req)
        } catch {
            
        }
        
        
    }
    
    func fetchFamily() {
        
        do {
            let req = Family.fetchRequest() as NSFetchRequest<Family>
            
//            let pred = NSPredicate(format: "name CONTAINS %@", "Fernando")
//            req.predicate = pred
            
//            let sort = NSSortDescriptor(key: "name", ascending: true)
//            req.sortDescriptors = [sort]
            
            self.families = try context.fetch(req)
        } catch {
            
        }
        
        
    }

}

