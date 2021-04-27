package com.example.homeworkreminder

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.homeworkreminder.model.HwkViewModel
import com.google.android.material.snackbar.Snackbar

class MyHwkAdapter(private val hwkViewModel: HwkViewModel): RecyclerView.Adapter<MyHwkAdapter.ViewHolder>() {
    private var myHwkList = hwkViewModel.assignmentList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val nameTextView: TextView = view.findViewById(R.id.hwkName)
        val dueDateTextView: TextView = view.findViewById(R.id.dueDate)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val hwkViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(hwkViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val hwk = myHwkList?.get(position)
        //set the text of the textview to the name
        holder.nameTextView.text = hwk?.name ?: ""
        holder.dueDateTextView.text = hwk?.dueDate ?: ""

        //context menu
        holder.itemView.setOnCreateContextMenuListener(){menu, view, menuInfo ->
            //set the menu title
            menu.setHeaderTitle(R.string.delete)

            //add the choices to the menu
            menu.add(R.string.yes).setOnMenuItemClickListener {
                //remove item from view model
                hwkViewModel.delete(hwk!!)
                Snackbar.make(view, R.string.deleteHwk, Snackbar.LENGTH_LONG)
                    .setAction(R.string.action, null).show()
                true
            }
            menu.add(R.string.no)
        }
    }

    override fun getItemCount(): Int {
        if (myHwkList != null) {
            return myHwkList!!.size
        } else return 0
    }

    fun update(){
        myHwkList = hwkViewModel.assignmentList.value
        notifyDataSetChanged()
    }
}