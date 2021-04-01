package com.example.funplants.sample

import com.example.funplants.R
import com.example.funplants.model.Plant

object SamplePlantData {
    val plantList = ArrayList<Plant>()

    init{
        plantList.add(Plant("Castiron Plant", R.drawable.castiron_plant))
        plantList.add(Plant("Corn Plant", R.drawable.corn_plant))
        plantList.add(Plant("Fiddle Leaf Fig", R.drawable.fiddle_leaf_fig))
        plantList.add(Plant("Meyer Lemon Tree", R.drawable.meyer_lemon_tree))
        plantList.add(Plant("Monstera Deliciosa", R.drawable.monstera_deliciosa))
        plantList.add(Plant("Palm Plant", R.drawable.palm_plant))
        plantList.add(Plant("Snake Plant", R.drawable.snake_plant))
        plantList.add(Plant("Spear Plant", R.drawable.spear_plant))
    }

}