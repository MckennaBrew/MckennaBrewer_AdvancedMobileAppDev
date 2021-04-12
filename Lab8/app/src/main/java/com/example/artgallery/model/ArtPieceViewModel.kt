package com.example.artgallery.model

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class ArtPieceViewModel: ViewModel() {
    val artList = MutableLiveData<ArrayList<ArtPiece>>()
}