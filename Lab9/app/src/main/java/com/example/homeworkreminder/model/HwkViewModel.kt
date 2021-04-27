package com.example.homeworkreminder.model

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.example.homeworkreminder.util.HwkDAO
import io.realm.RealmResults

open class HwkViewModel: ViewModel() {

    private val hwkDAO = HwkDAO()
    val assignmentList: LiveData<RealmResults<Hwk>> = hwkDAO.getHwk()

    fun add(newHwk: Hwk){
        hwkDAO.addHwk(newHwk)
    }

    fun delete(oldHwk: Hwk){
        hwkDAO.deleteHwk(oldHwk.id)
    }

    fun deleteAll(){
        hwkDAO.deleteAll()
    }

    override fun onCleared() {
        super.onCleared()
        hwkDAO.close()
    }

}
