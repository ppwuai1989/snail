package org.platform.snail.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.platform.snail.beans.Tree;

public class CommonTreeUtils {
	private List<Map<String, String>> resources;

	public CommonTreeUtils(List<Map<String, String>> resources) {
		this.resources = resources;
	}

	public List<Tree> getTreeList(String id) {
		List<Tree> list = new ArrayList<Tree>();
		List<Map<String, String>> temp = this.getChildResourcesList(id);
		if (temp != null) {
			for (int i = 0; i < temp.size(); i++) {
				Map<String, String> row = temp.get(i);
				Tree tree = this.getChildTreeList(row);
				list.add(tree);
			}
		}
		return list;
	}

	public List<Tree> getTreeListCaseSelf(String id) {
		Map<String, String> resources = null;
		for (Map<String, String> temp : this.resources) {
			if (String.valueOf(temp.get("ID")).equals(id)) {
				resources = temp;
				break;
			}
		}
		Tree o = this.getChildTreeList(resources);

		List<Tree> list = new ArrayList<Tree>();
		List<Map<String, String>> temp = this.getChildResourcesList(id);
		if (temp != null) {
			for (int i = 0; i < temp.size(); i++) {
				Map<String, String> row = temp.get(i);
				Tree tree = this.getChildTreeList(row);
				list.add(tree);
			}
		}
		o.setChildren(list);
		List<Tree> rst = new ArrayList<Tree>();
		rst.add(o);
		return rst;
	}

	public List<Map<String, String>> getChildResourcesList(String id) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		if (this.resources != null) {
			for (int i = 0; i < this.resources.size(); i++) {
				Map<String, String> row = (Map<String, String>) this.resources.get(i);
				if (String.valueOf(row.get("PID")).equals(id)) {
					list.add(row);
				}
			}
		}
		return list;
	}

	private Tree getChildTreeList(Map<String, String> resources) {
		Tree tree = new Tree();
		tree.setIcon(String.valueOf(resources.get("ICON")));
		tree.setHref(String.valueOf(resources.get("HREF")));
		tree.setSrc(String.valueOf(resources.get("SRC")));
		tree.setId(String.valueOf(resources.get("ID")));
		tree.setText(String.valueOf(resources.get("TEXT")));
		if (String.valueOf(resources.get("STATE")) == null) {
			tree.setState("open");
		} else {
			tree.setState(String.valueOf(resources.get("STATE")));
		}
		if (String.valueOf(resources.get("CHILD_COUNT")).equals("0")) {
			tree.setCls("file");
			tree.setLeaf(true);
			tree.setState("open");
		} else {
			tree.setCls("folder");
			tree.setLeaf(false);
			List<Tree> children = new ArrayList<Tree>();
			List<Map<String, String>> list = this.getChildResourcesList(tree.getId());
			for (Map<String, String> childResources : list) {
				children.add(getChildTreeList(childResources));

			}
			tree.setChildren(children);
		}
		return tree;
	}

}
