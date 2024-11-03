//
//  UserDefault.swift
//  UserDefaultInSwift
//
//  Created by Engy on 7/31/2567 BE.
//

import Foundation
class UserDefaultManager {
    static let shared = UserDefaultManager()
    private let pref = UserDefaults.standard
    var continueAsAGuest: Bool = false
    var islogin: Bool = false
    var darkModeEnabled: Bool = false

    var name: String = ""
    var email: String = ""
    var password: String = ""

    private init(){
        getStoredData()
    }

    func getStoredData(){
            self.continueAsAGuest = getSharedBool(forKey: "guest")
            self.islogin  = getSharedBool(forKey: "islogin")
            self.darkModeEnabled  = getSharedBool(forKey: "darkMode")
            self.name = getSharedString(forKey: "name")
            self.email = getSharedString(forKey: "email")
            self.password = getSharedString(forKey: "password")
    }
    func storeData(){
        setSharedValue("guest", value: continueAsAGuest)
        setSharedValue("islogin", value: islogin)
        setSharedValue("darkMode",value: darkModeEnabled)
        setSharedValue("name", value: name)
        setSharedValue("email", value: email)
        setSharedValue("password", value: password)
    }
    func logout(){
      removeValue(forKey: "guest")
      removeValue(forKey: "islogin")
      removeValue(forKey: "darkMode")
      removeValue(forKey: "name")
      removeValue(forKey: "email")
      removeValue(forKey: "password")
    }

    private func setSharedValue(_ key: String, value: Any) {
        self.pref.set(value, forKey: key)
    }
    private func getSharedValue(forKey key: String) -> Any? {
        return self.pref.object(forKey: key)
    }
    private func getSharedString(forKey key: String) -> String {
        return self.pref.object(forKey: key) as? String ?? ""
    }

    private func getSharedInt(forKey key: String) -> Int {
        return self.pref.object(forKey: key) as? Int ?? 0
    }

    private func getSharedBool(forKey key: String) -> Bool {
        return self.pref.object(forKey: key) as? Bool ?? false
    }

    private func removeValue(forKey key: String) {
        self.pref.removeObject(forKey: key)
    }
    private func clearCache() {
        let domain = Bundle.main.bundleIdentifier ?? ""
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }


//    func getStoredData() {
//        self.continueAsAGuest = pref.object(forKey: "guest") as? Bool ?? false
//        self.name = pref.object(forKey: "name") as? String ?? ""
//        self.email = pref.object(forKey: "email") as? String ?? ""
//        self.password = pref.object(forKey: "password") as? String ?? ""
//    }
//    func storeData() {
//        pref.setValue(continueAsAGuest, forKey: "guest")
//        pref.setValue(name, forKey: "name")
//        pref.setValue(email, forKey: "email")
//        pref.setValue(password, forKey: "password")
//    }
//    func logout() {
//        pref.removeObject(forKey: "guest")
//        pref.removeObject(forKey: "name")
//        pref.removeObject(forKey: "email")
//        pref.removeObject(forKey: "password")
//    }
}
//case we use UserDefaultManager
//User Preferences and Settings:
//Login Information:
//App State
//User Data
//Feature Flags:
//Counters and Flags:
//Temporary Storage
