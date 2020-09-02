package com.example.fluttermodule

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<Button>(R.id.button1).setOnClickListener {
            startActivity(
                FlutterActivity
                    .withCachedEngine("my_engine_id")
                    .build(this)
            )
        }
    }
}