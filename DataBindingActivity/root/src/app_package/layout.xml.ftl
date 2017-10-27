<layout xmlns:android="http://schemas.android.com/apk/res/android"
				xmlns:tools="http://schemas.android.com/tools"
				xmlns:app="http://schemas.android.com/apk/res-auto">

	<data>

		<variable
			name="model"
			type="${packageName}.${viewModelClass}"/>

			<variable
      name="navigator"
      type="${packageName}.${navigatorClass}"/>
	</data>

	<LinearLayout
		android:layout_width="match_parent"
		android:layout_height="match_parent"
		android:orientation="vertical">
		<TextView
      android:layout_width="wrap_content"
      android:layout_height="wrap_content"
      android:text="@{model.hello}"
			tools:text="hello text here"/>

    <Button
      android:layout_width="wrap_content"
      android:layout_height="wrap_content"
      android:onClick="@{()->model.click1()}"
      android:text="click1"/>

    <Button
      android:layout_width="wrap_content"
      android:layout_height="wrap_content"
      android:onClick="@{()->navigator.click2()}"
      android:text="click2"/>
	</LinearLayout>
</layout>
