package com.cngc.pm.dao.impl;

import static com.cngc.utils.Common.isNumeric;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.cngc.pm.dao.RoleDAO;
import com.cngc.pm.model.Role;

@Repository
public class RoleDAOImpl extends BaseDAOImpl<Role,Long> implements RoleDAO{

	@Override
	public Set<Role> getSet(String ids){
		Set<Role> set = new HashSet<>();
		String id[] = ids.split(",");
		int j = id.length;
		Long[] idss = new Long[j];
		for(int i=0; i<id.length; i++) {
			String str = id[i];
			 if (!isNumeric(str)) {
				 return null;
			 }
			 idss[i] = Long.valueOf(str);
		}
		try {
			for(Long k : idss) {
				set.add(this.find(k));
			}
		} catch (Exception e) {
			return null;
		}

		return set;
	}
}
