package com.example.funplants

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.funplants.PlantAdapter.ViewHolder
import com.example.funplants.model.Plant

class PlantAdapter(private val plantList: ArrayList<Plant>, private val clickListener:(Plant) -> Unit): RecyclerView.Adapter<ViewHolder>() {

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val plantTextView: TextView = view.findViewById(R.id.textView)
    }
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)

        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)

        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val plant = plantList[position]

        holder.plantTextView.text = plant.name

        holder.itemView.setOnClickListener{clickListener(plant)}
    }

    override fun getItemCount() = plantList.size

}