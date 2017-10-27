package ${packageName};

import android.databinding.ObservableField;

public class ${viewModelClass} extends BaseViewModel {
	private ${navigatorClass} navigator;

	public final ObservableField<String> hello = new ObservableField<>();

	public ${viewModelClass}(${navigatorClass} navigator){
		this.navigator = navigator;
	}

	@Override
	public void onCreate() {
		super.onCreate();
		hello.set("hello world!!!");
	}

	public void click1() {
    navigator.click1();
		hello.set("clicked 1");
  }
}
