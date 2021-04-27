package com.example.homeworkreminder

import io.realm.Realm
import io.realm.RealmConfiguration

class DataApplication: android.app.Application() {
    override fun onCreate() {
        super.onCreate()

        Realm.init(this)

        //define realm configuration
        val realmConfig  = RealmConfiguration.Builder().build()
        //for debugging or if you change the db structure and don't want to migrate this will clear out the database
        //Realm.deleteRealm(realmConfig)

        Realm.setDefaultConfiguration(realmConfig )
    }
}

