package com.example.artgallery

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.artgallery.model.ArtPieceViewModel
import com.example.artgallery.util.JSONData

class MainActivity : AppCompatActivity() {
    private val viewModel: ArtPieceViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (viewModel.artList.value == null){
            val loader = JSONData(this)

            loader.loadJSON1(viewModel)
           // loader.loadJSON2(this, viewModel)

            Log.i("main", "in if to load data")
        }

        setUpRecyclerView()
    }

    private fun setUpRecyclerView(){
        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        //define an adapter
        val adapter = MyListAdapter(viewModel)

        //assign the adapter to the recycle view
        recyclerView.adapter = adapter

        //create the observer
        viewModel.artList.observe(this, Observer {
            adapter.update()
        })

    }
}