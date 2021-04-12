package com.example.artgallery

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.artgallery.model.ArtPieceViewModel
import com.squareup.picasso.Picasso

class MyListAdapter(private val artViewModel: ArtPieceViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {
    private var myArtList = artViewModel.artList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val titleTextView: TextView = view.findViewById(R.id.artTitle)
        val nameTextView: TextView = view.findViewById(R.id.artistName)
        val dateTextView: TextView = view.findViewById(R.id.artDate)
        val countryTextView: TextView = view.findViewById(R.id.artCountry)
        val imageView: ImageView = view.findViewById(R.id.imageView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.card_list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val art = myArtList?.get(position)

        holder.titleTextView.text = art?.title ?: ""

        holder.nameTextView.text = art?.artistDisplayName ?: ""

        holder.dateTextView.text = art?.objectDate ?: ""

        holder.countryTextView.text = art?.country ?: ""

        //load image using Picasso
        Picasso.get().load(art?.primaryImage ?: "")
            .error(R.drawable.image_placeholder)
            .placeholder(R.drawable.image_placeholder)
            .into(holder.imageView);
    }

    override fun getItemCount(): Int {
        if (myArtList != null)
        {
            return myArtList!!.size
        } else return 0
    }

    fun update(){
        myArtList = artViewModel.artList.value
        notifyDataSetChanged()
        Log.i("adapter update", artViewModel.artList.value?.size.toString())
    }
}