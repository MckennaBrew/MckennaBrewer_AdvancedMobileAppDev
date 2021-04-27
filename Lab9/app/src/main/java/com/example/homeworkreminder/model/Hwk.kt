package com.example.homeworkreminder.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey

open class Hwk(
    @PrimaryKey var id: String,
    var name: String, var dueDate: String): RealmObject()
    {
        constructor(): this("", "", "")
    }