package com.example.homeworkreminder.util

import com.example.homeworkreminder.model.Hwk
import io.realm.Realm

open class HwkDAO() {

    private val realmDB: Realm = Realm.getDefaultInstance()

    fun getHwk(): RealmLiveData<Hwk>{
        return RealmLiveData(realmDB.where(Hwk::class.java).findAllAsync())
    }

    fun addHwk(hwk: Hwk){
        realmDB.executeTransactionAsync{transactionRealm ->
            transactionRealm.insert(hwk)
        }
    }

    fun deleteHwk(id: String){
        realmDB.executeTransactionAsync{transactionRealm ->
            transactionRealm.where(Hwk::class.java).equalTo("id", id).findAll().deleteAllFromRealm()
        }
    }

    fun deleteAll(){
        realmDB.executeTransactionAsync{transactionRealm ->
            transactionRealm.deleteAll()
        }
    }

    fun close(){
        realmDB.close()
    }

}