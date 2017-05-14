package ${packageName};

import android.databinding.ObservableField;

public class ${viewModelClass} extends BaseViewModel {
	private ${navigatorClass} navigator;

	public final ObservableField<String> hello = new ObservableField<>();

	public ${viewModelClass}(${navigatorClass} navigator){
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
