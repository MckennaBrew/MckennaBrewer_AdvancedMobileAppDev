package com.example.artgallery.util

import android.content.Context
import android.util.Log
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.artgallery.model.ArtPieceViewModel
import com.example.artgallery.model.ArtPiece
import org.json.JSONException
import org.json.JSONObject

class JSONData(context: Context) {
    val queue = Volley.newRequestQueue(context)

    val api_url = "https://collectionapi.metmuseum.org/public/collection/v1/search?isHighlight=true&hasImage=true&q=japan"

    var base_api_url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/"

    var objectID: String = ""
    val dataList = ArrayList<ArtPiece>()

    fun loadJSON1(artpieceViewModel: ArtPieceViewModel) {
        val url = api_url
        //val queue = Volley.newRequestQueue(context)

        val stringRequest = StringRequest(Request.Method.GET, url,
                { response ->
                    parseJSONObjects(response, artpieceViewModel)
                },
                {
                    Log.e("ERROR", error("art list request failed"))


                })
        // Add the request to the RequestQueue
        queue.add(stringRequest)
    }

    fun loadJSON2(artpieceViewModel: ArtPieceViewModel, url: String) {
        //val queue = Volley.newRequestQueue(context)

        //Log.i("hello", "helloooooo")
        //Log.i("this is url 2: ", base_api_url.toString() + " " + objectID.toString())

        val stringRequest2 = StringRequest(Request.Method.GET, url,
                { response ->
                    parseJSON(response, artpieceViewModel)
                },
                {
                    Log.e("ERROR", error("request failed"))
                })
        // Add the request to the RequestQueue.

        queue.add(stringRequest2)
    }

    // retrieve array of objects we want to display from first API call
    fun parseJSONObjects(response: String, artpieceViewModel: ArtPieceViewModel) {
        val artData = JSONObject(response)

        val total = artData.getString("total")

        val idArray = artData.getJSONArray("objectIDs")

        Log.i("object id: ", "hello there")
        Log.i("total ", total.toString())
        //Log.i("array length ", idArray.length().toString())

        var new_url = ""

        for (i in 0 until idArray.length()){
            objectID = idArray[i].toString()

            new_url = base_api_url + objectID

            Log.i("base url ", new_url)

            loadJSON2(artpieceViewModel, new_url)
        }
    }

    fun parseJSON(response: String, artpieceViewModel: ArtPieceViewModel) {
        //val dataList = ArrayList<ArtPiece>()

        try {
            //create JSONObject
            val artObject = JSONObject(response)


            //get values
            val objectId = artObject.getInt("objectID")
            val title = artObject.getString("title")
            val artistDisplayName = artObject.getString("artistDisplayName")
            val objectDate = artObject.getString("objectDate")
            val country = artObject.getString("country")
            val primaryImage = artObject.getString("primaryImageSmall")

            val newArtPiece = ArtPiece(objectId, title, artistDisplayName, objectDate, country, primaryImage)

            dataList.add(newArtPiece)

            Log.i("added ", title)

        }
        catch (e: JSONException) {
            e.printStackTrace()
        }

        artpieceViewModel.artList.value = dataList
        Log.i("json data list value", dataList.size.toString())

    }
}