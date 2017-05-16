package ${packageName};

<#if screenType == "Fragment">
import android.support.v4.app.Fragment;

public class ${screenClass} extends Fragment {
	private static final String PARAM = "param";

<#else>
public class ${screenClass} extends AppCompatActivity {
</#if>
  private ${viewModelClass} ${screenType?lower_case}Model;

	<#if screenType == "Fragment">
	private String param;

	public static ${screenClass} instance() {
		return new ${screenClass}();
	}

	public ${screenClass}() {
    // Required empty public constructor
  }

	public static ${screenClass} instance(String param) {
		Bundle bundle = new Bundle();
		bundle.putString(PARAM, param);
		${screenClass} fragment = new ${screenClass}();
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
    return DataBindingUtil.inflate(inflater, R.layout.${layoutName}, container, false).getRoot();
  }

  @Override
  public void onActivityCreated(@Nullable Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState);
    ${screenClass}Binding binding = DataBindingUtil.getBinding(getView());
		${screenType?lower_case}Model = new ${viewModelClass}(navigator);
    binding.setModel(${screenType?lower_case}Model);
		binding.setNavigator(navigator);
    ${screenType?lower_case}Model.onCreate();
  }

	@Override
	public void onDestroyView() {
		super.onDestroyView();
		${screenType?lower_case}Model.onDestroy();
	}
	<#else>
	@Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    ${screenClass}Binding binding = DataBindingUtil.setContentView(this, R.layout.${layoutName});
    ${screenType?lower_case}Model = new ${viewModelClass}(navigator);
    binding.setModel(${screenType?lower_case}Model);
    binding.setNavigator(navigator);
    ${screenType?lower_case}Model.onCreate();
  }

	@Override
  protected void onDestroy() {
    super.onDestroy();
    ${screenType?lower_case}Model.onDestroy();
  }
</#if>

	/***********************************
 	* navigator
 	***********************************/
	private ${navigatorClass} navigator = new ${navigatorClass}() {
	 @Override
	 public void click1() {
		 Log.i("APP# ${screenClass} | click1", "|" + "click1");
	 }

	 @Override
	 public void click2() {
		 Log.i("APP# ${screenClass} | click2", "|" + "click2");
	 }
	};
}
