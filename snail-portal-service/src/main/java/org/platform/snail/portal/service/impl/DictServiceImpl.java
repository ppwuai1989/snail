package org.platform.snail.portal.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.apache.ibatis.jdbc.SqlRunner;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.DictCategoryDao;
import org.platform.snail.portal.dao.DictDao;
import org.platform.snail.portal.model.Dict;
import org.platform.snail.portal.model.DictCategory;
import org.platform.snail.portal.service.DictService;
import org.platform.snail.portal.vo.DictVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.DictUtils;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("dictService")
public class DictServiceImpl implements DictService {

	Logger logger = LogManager.getLogger(this.getClass());
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	@Autowired
	DictDao dictDao;
	@Autowired
	private DictCategoryDao dictCategoryDao;
	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findDictList(Dict condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<DictVo> list = this.dictDao.findList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.dictDao.findCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertDict(JSONObject josnObject, SystemUser systemUser) throws Exception {
		Dict dictCategory = new Dict();
		SnailBeanUtils.copyProperties(dictCategory, josnObject);

		if (SnailUtils.isBlankString(dictCategory.getName())) {

			return new DataResponse(false, "名称不能为空！");
		}
		if (SnailUtils.isBlankString(dictCategory.getCategoryId())) {

			return new DataResponse(false, "类型不能为空！");
		}
		if (SnailUtils.isBlankString(dictCategory.getCode())) {

			return new DataResponse(false, "编码不能为空！");
		}

		int temp = this.dictDao.isExitByNameAndCategoryId(dictCategory.getName(), dictCategory.getCategoryId());
		if (temp > 0) {
			return new DataResponse(false, "名称已存在！");
		}
		this.dictDao.insert(dictCategory);
		this.dataBaseLogService.log("添加字典", "字典", "", dictCategory.getName(), dictCategory.getName(), systemUser);
		return new DataResponse(true, "添加字典成功！");
	}

	@Override
	public DataResponse updateDict(JSONObject josnObject, SystemUser systemUser) throws Exception {
		Dict dictCategory = new Dict();
		SnailBeanUtils.copyProperties(dictCategory, josnObject);
		if (SnailUtils.isBlankString(dictCategory.getCode())) {

			return new DataResponse(false, "编号不能为空！");
		}
		if (SnailUtils.isBlankString(dictCategory.getCategoryId())) {

			return new DataResponse(false, "类型不能为空！");
		}
		if (SnailUtils.isBlankString(dictCategory.getName())) {

			return new DataResponse(false, "名称不能为空！");
		}
		this.dictDao.updateByPrimaryKeySelective(dictCategory);
		this.dataBaseLogService.log("变更字典", "字典", "", dictCategory.getName(), dictCategory.getName(), systemUser);
		return new DataResponse(true, "字典变更成功！");
	}

	@Override
	public DataResponse selectDictByPrimaryKey(int id) throws Exception {
		DataResponse rst = new DataResponse();
		rst.setResponse(this.dictDao.selectByPrimaryKey(id));
		return rst;
	}

	@Override
	public DataResponse deleteDictByDictId(int id, SystemUser systemUser) throws Exception {
		this.dictDao.deleteByPrimaryKey(id);
		this.dataBaseLogService.log("删除字典", "字典", String.valueOf(id), String.valueOf(id), "字典", systemUser);
		return new DataResponse(true, "字典删除成功！");
	}

	@Override
	public List<Dict> findListByCategoryId(String categoryId, String selected, Map<String, Object> params)
			throws Exception {
		DictCategory dictCategory = dictCategoryDao.selectByPrimaryKey(categoryId);
		List<Dict> list = new ArrayList<Dict>();

		if (SnailUtils.isNotBlankString(dictCategory.getRemark())) {
			SqlRunner sqlRunner = this.getSqlRunner();
			try {
				String sql = this.getContentByTemplate(dictCategory.getRemark(), "\\$\\{[^\\}]+\\}", params);
				List<Map<String, Object>> items = sqlRunner.selectAll(sql);
				for (Map<String, Object> p : items) {
					Dict o = new Dict();
					o.setCategoryId(categoryId);
					o.setCode(String.valueOf(p.get("CODE")));
					o.setName(String.valueOf(p.get("NAME")));
					list.add(o);
				}
			} catch (Exception e) {
				this.logger.error(e);
			} finally {
				if (sqlRunner != null) {
					sqlRunner.closeConnection();
				}
			}

		} else {
			list = this.dictDao.findListByCategoryId(categoryId);
		}
		if (SnailUtils.isBlankString(selected)) {
			for (Dict dict : list) {
				dict.setSelected(true);
				break;
			}
		}
		return list;
	}

	// 刷新js文件
	public void flushJavaScriptFile(String path, String fileName, ServletContext servletContext) {
		Map<String, List> dictMap = this.loadAutoLoadDicts();
		servletContext.setAttribute(CommonKeys.dictAppKey, dictMap);
		String dictJsonListString = DictUtils.toJsonString(dictMap, new String[] { "TABLE_NAME" });
		dictJsonListString = dictJsonListString.replaceAll(" ", "");
		dictJsonListString = dictJsonListString.replaceAll("\n", "");
		dictJsonListString = dictJsonListString.replaceAll("\t", "");
		dictJsonListString = "var staticDictObject=" + dictJsonListString;
		File file = new File(path + fileName);
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(file);
			Writer out = new OutputStreamWriter(fos, "UTF-8");
			out.write(dictJsonListString);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fos != null) {
					fos.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		logger.info("created dict.js at " + path + fileName);
	}

	// 自动加载字典表
	private Map<String, List> loadAutoLoadDicts() {
		Map<String, List> rst = new HashMap<String, List>();
		// dict_catagory取出所有类型
		List<Map> dict = this.dictCategoryDao.selectAllDictList();
		SqlRunner sqlRunner = this.getSqlRunner();
		String category = "";
		String remark = "";
		String sql = "";
		try {
			if (dict != null && dict.size() > 0) {
				for (Map<String, String> row : dict) {
					category = row.get("CATEGORY_ID");
					remark = row.get("REMARK");
					if (SnailUtils.isBlankString(remark)) {
						sql = "select * from dict where category_id= '" + category + "'";
					} else {
						sql = remark;
					}

					if (!SnailUtils.isBlankString(sql)) {
						Map<String, Object> params = new HashMap<String, Object>();
						params.put("gradeId", "1,2,3");

						List value = null;
						sql = this.getContentByTemplate(sql, "\\$\\{[^\\}]+\\}", params);
						this.logger.info(sql);
						try {
							value = sqlRunner.selectAll(sql);
						} catch (SQLException e) {

							e.printStackTrace();
						}
						rst.put("STATIC_DATA_" + category, value);
						this.logger.info("dict loading " + category + " [" + row.get("name") + "]");
					}
				}
			}
		} finally {
			if (sqlRunner != null) {
				sqlRunner.closeConnection();
			}
		}
		return rst;
	}

	// 获取sql驱动
	private SqlRunner getSqlRunner() {
		SqlRunner sqlRunner = null;
		Connection conn = null;
		try {
			conn = sqlSessionFactory.getConfiguration().getEnvironment().getDataSource().getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlRunner = new SqlRunner(conn);
		return sqlRunner;
	}

	// 根据模板获取内容
	private String getContentByTemplate(String expression, String regex, Map<String, Object> valueMap) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(expression);
		String paramKey;
		while (m.find()) {
			paramKey = m.group(0);
			paramKey = paramKey.substring(2, paramKey.length() - 1);
			Object paramValue = valueMap.get(paramKey);
			expression = m.replaceFirst(String.valueOf(paramValue));
			m = p.matcher(expression);
		}
		return expression;
	}
}
