package com.mycompany.homewidgettest

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import com.mycompany.homewidgettest.R
import es.antonborri.home_widget.HomeWidgetProvider

class MyHomeWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val launchIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            val pendingIntent = PendingIntent.getActivity(
                context,
                widgetId,
                launchIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )

            val dayLabels = listOf("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

            val dayIds = listOf(
                R.id.day_1, R.id.day_2, R.id.day_3, R.id.day_4,
                R.id.day_5, R.id.day_6, R.id.day_7
            )

            val dateIds = listOf(
                R.id.date_1, R.id.date_2, R.id.date_3, R.id.date_4,
                R.id.date_5, R.id.date_6, R.id.date_7
            )

            val selectedDayIndex = widgetData.getInt("selected_day_index", 0)

            val views = RemoteViews(context.packageName, R.layout.my_home_widget).apply {
                for (i in 0..6) {
                    val dateText = widgetData.getString("widget_date_${i + 1}", "") ?: ""

                    setTextViewText(dayIds[i], dayLabels[i])
                    setTextViewText(dateIds[i], dateText)

                    if (i == selectedDayIndex) {
                        setInt(dayIds[i], "setBackgroundResource", R.drawable.widget_day_circle_active)
                        setTextColor(dayIds[i], 0xFFFFFFFF.toInt())
                    } else {
                        setInt(dayIds[i], "setBackgroundResource", R.drawable.widget_day_circle)
                        setTextColor(dayIds[i], 0xFF22455D.toInt())
                    }

                    setTextColor(dateIds[i], 0xFF0E2233.toInt())

                    setOnClickPendingIntent(dayIds[i], pendingIntent)
                    setOnClickPendingIntent(dateIds[i], pendingIntent)
                }

                setOnClickPendingIntent(R.id.widget_root, pendingIntent)
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
