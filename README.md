# AndroidStudio DataBinding Activity Template
Make DataBinding code template for Android Studio

* reference: https://github.com/jakubkinst/Android-ViewModelBinding
* recommend: Turn on Auto Import see http://stackoverflow.com/a/16616085/1025379

## How To Use

1. Copy `DataBindingActivity` to `{Android Studio}/Contents/plugins/android/lib/templates/`
2. Restart Android Studio
3. Select folder in Android Studio
4. `File - New - Activity - DataBinding Activity`
5. Rebuild if an error occurs.

## Generated Code Sample

### Activity

```java
package kr.susemi99.codetemplate;

import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import kr.susemi99.codetemplate.databinding.MainActivityBinding;

public class MainActivity extends AppCompatActivity {
  private MainActivityBinding binding;
  private MainActivityModel activityModel;

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    binding = DataBindingUtil.setContentView(this, R.layout.main_activity);
    activityModel = new MainActivityModel(navigator);
    binding.setModel(activityModel);
    binding.setNavigator(navigator);
    activityModel.onCreate();
  }

  @Override
  protected void onDestroy() {
    super.onDestroy();
    activityModel.onDestroy();
  }

  /***********************************
   * navigator
   ***********************************/
  private MainActivityNavigator navigator = new MainActivityNavigator() {
    @Override
    public void click1() {
      Log.i("APP# MainActivity | click1", "|" + "click1");
    }

    @Override
    public void click2() {
      Log.i("APP# MainActivity | click2", "|" + "click2");
    }
  };
}
```

### Fragment

```java
package kr.susemi99.codetemplate;

import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import kr.susemi99.codetemplate.databinding.MainFragmentBinding;

public class MainFragment extends Fragment {
  private static final String PARAM = "param";

  private MainFragmentBinding binding;
  private MainFragmentModel fragmentModel;

  private String param;

  public MainFragment() {
    // Required empty public constructor
  }

  public static MainFragment instance() {
    return new MainFragment();
  }

  public static MainFragment instance(String param) {
    Bundle bundle = new Bundle();
    bundle.putString(PARAM, param);
    MainFragment fragment = new MainFragment();
    fragment.setArguments(bundle);
    return fragment;
  }

  @Override
  public void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    if (getArguments() != null) {
      param = getArguments().getString(PARAM);
    }
  }

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    return DataBindingUtil.inflate(inflater, R.layout.main_fragment, container, false).getRoot();
  }

  @Override
  public void onActivityCreated(@Nullable Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState);
    binding = DataBindingUtil.getBinding(getView());
    fragmentModel = new MainFragmentModel(navigator);
    binding.setModel(fragmentModel);
    binding.setNavigator(navigator);
    fragmentModel.onCreate();
  }

  @Override
  public void onDestroyView() {
    super.onDestroyView();
    fragmentModel.onDestroy();
  }

  /***********************************
   * navigator
   ***********************************/
  private MainFragmentNavigator navigator = new MainFragmentNavigator() {
    @Override
    public void click1() {
      Log.i("APP# MainFragment | click1", "|" + "click1");
    }

    @Override
    public void click2() {
      Log.i("APP# MainFragment | click2", "|" + "click2");
    }
  };
}
```

### ViewModel

```java
package kr.susemi99.codetemplate;

import android.databinding.ObservableField;

public class MainActivityModel {
  public final ObservableField<String> hello = new ObservableField<>();
  private MainActivityNavigator navigator;

  public MainActivityModel(MainActivityNavigator navigator) {
    this.navigator = navigator;
  }

  public void onCreate() {
    hello.set("hello world!!!");
  }

  public void onDestroy() {}

  public void click1() {
    navigator.click1();
  }
}
```

### Navigator

handle event in activity

```java
package kr.susemi99.codetemplate;

public interface MainActivityNavigator {
  void click1();

  void click2();
}
```

### Layout

```xml
<layout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:app="http://schemas.android.com/apk/res-auto"
        xmlns:tools="http://schemas.android.com/tools">

  <data>

    <variable
      name="model"
      type="kr.susemi99.codetemplate.MainActivityModel"/>

    <variable
      name="navigator"
      type="kr.susemi99.codetemplate.MainActivityNavigator"/>
  </data>

  <LinearLayout
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <TextView
      android:layout_width="wrap_content"
      android:layout_height="wrap_content"
      android:text="@{model.hello}"/>

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
```
