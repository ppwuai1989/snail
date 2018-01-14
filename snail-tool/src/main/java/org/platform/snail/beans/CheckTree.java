package org.platform.snail.beans;

import java.io.Serializable;
import java.util.List;

public class CheckTree implements Serializable {
	private String id;
	private String text;
	private Boolean leaf;
	private String cls = "x-btn-text";
	private String icon;
	private Boolean checked;
	private List<CheckTree> children;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Boolean getLeaf() {

		return leaf;
	}

	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public List<CheckTree> getChildren() {
		return children;
	}

	public void setChildren(List<CheckTree> children) {
		this.children = children;
	}

}
