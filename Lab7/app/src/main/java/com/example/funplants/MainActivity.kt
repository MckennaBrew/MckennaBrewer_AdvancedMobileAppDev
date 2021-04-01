package com.example.funplants

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuInflater
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.funplants.model.Plant
import com.example.funplants.sample.SamplePlantData

class MainActivity : AppCompatActivity() {

    private var plantList = SamplePlantData.plantList

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //val toolbar: Toolbar = findViewById(R.id.toolbar)
        //setSupportActionBar(toolbar)

        setUpRecyclerView()
    }

    private fun setUpRecyclerView(){
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))

        val adapter = PlantAdapter(plantList, {item: Plant -> itemClicked(item)})

        recyclerView.adapter = adapter

        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
    }

    private fun itemClicked(item: Plant){
        val intent = Intent(this, DetailActivity::class.java)

        intent.putExtra("name", item.name)
        intent.putExtra("resourceID", item.imageResourceID)

        startActivity(intent)
    }


    override fun onSaveInstanceState(outState: Bundle) {
        //outState.putParcelableArrayList("plantList", plantList)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        Log.i("main", "in on restore")
        super.onRestoreInstanceState(savedInstanceState)
        //plantList = savedInstanceState.getParcelableArrayList<Character>("plantList") as ArrayList<Character>
        setUpRecyclerView()
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.options_menu, menu)
        return true
    }
}