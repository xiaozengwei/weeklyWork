package com.gx.soft.home.web;

import com.gx.core.hibernate.PropertyFilter;
import com.gx.soft.home.persistence.domain.SxpzRecord;
import com.gx.soft.home.persistence.manager.SxpzRecordManager;
import com.gx.soft.mobile.persistence.domain.ByProjectIntroduction;
import com.gx.soft.mobile.persistence.manager.ByProIntroManager;
import com.gx.soft.sys.persistence.domain.VUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("hc")
@SessionAttributes("user_session")
public class HController {

	@Autowired
	private SxpzRecordManager sxpzRecordManager;
	@Autowired
	private ByProIntroManager byProIntroManager;

	/**
	 * 首页查询界面
	 *
	 * @param model
	 * @return
	 */

	@RequestMapping("layout")
	public String layout(@ModelAttribute("user_session") VUser user, Model model,@RequestParam Map<String, Object> parameterMap) {

		String statusCode = "1";// 成功
		String message = "获取菜单列表成功";
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		List<SxpzRecord> sxpzRecord = null;

		return "home/index_layout";
	}




}
