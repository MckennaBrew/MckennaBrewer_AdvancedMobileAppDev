package com.example.homeworkreminder

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.EditText
import android.widget.LinearLayout
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.homeworkreminder.model.Hwk
import com.example.homeworkreminder.model.HwkViewModel
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.util.*


class MainActivity : AppCompatActivity() {

    private val viewModel: HwkViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(findViewById(R.id.toolbar))

        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        //divider line between rows
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        //define an adapter
        val adapter = MyHwkAdapter(viewModel)

        //assign the adapter to the recycle view
        recyclerView.adapter = adapter

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { view ->
            //create alert dialog
            val dialog = AlertDialog.Builder(this)

            //create edit text
            //val editText1 = EditText(applicationContext)
            //val editText2 = EditText(applicationContext)

            //add edit text to dialog
            //dialog.setView(editText1)
            //dialog.setView(editText2)

            //set dialog title
            //dialog.setTitle(R.string.addHwk)
            //dialog.setView(R.layout.dialog_box)

            val layout = LinearLayout(this)
            layout.orientation = LinearLayout.VERTICAL

            val nameBox = EditText(this)
            nameBox.hint = "Assignment Name"
            layout.addView(nameBox) // Notice this is an add method

            val duedateBox = EditText(this)
            duedateBox.hint = "Due Date"
            layout.addView(duedateBox) // Another add method

            dialog.setView(layout) // Again this is a set method, not add

            //set OK action
            dialog.setPositiveButton(R.string.add) {dialog, which ->
                val newHwkName = nameBox.text.toString()
                val newDueDate = duedateBox.text.toString()

                if (!newHwkName.isEmpty() || !newDueDate.isEmpty()){
                    //add item
                    viewModel.add(Hwk(UUID.randomUUID().toString(), newHwkName, newDueDate))

                    Snackbar.make(view, R.string.hwkAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                }
            }
            //sets cancel action
            dialog.setNegativeButton(R.string.cancel) { dialog, which ->
                //cancel
            }
            dialog.show()
        }

        //create the observer
        viewModel.assignmentList.observe(this, Observer {
            adapter.update()
        })

    }


    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        return when (item.itemId) {
            R.id.action_clear -> {
                viewModel.deleteAll()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

//    override fun onSaveInstanceState(outState: Bundle) {
//        //outState.putParcelableArrayList("hwkList", viewModel.assignmentList)
//        super.onSaveInstanceState(outState)
//    }
//
//    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
//        Log.i("main", "in on restore")
//        super.onRestoreInstanceState(savedInstanceState)
//    }


}