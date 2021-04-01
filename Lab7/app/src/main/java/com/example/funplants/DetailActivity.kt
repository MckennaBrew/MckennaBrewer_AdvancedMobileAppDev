package com.example.funplants

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.widget.ImageView
import android.widget.TextView

class DetailActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        //val toolbar: Toolbar = findViewById(R.id.toolbar)
        //setSupportActionBar(toolbar)

        val name = intent.getStringExtra("name")
        val resourceID = intent.getIntExtra("resourceID", -1)

        val plantImage: ImageView = findViewById(R.id.imageViewPlant)
        plantImage.setImageResource(resourceID)

        val plantName: TextView = findViewById(R.id.textViewName)
        plantName.text = name
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.options_menu, menu)
        return true
    }
}