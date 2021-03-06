package com.cngc.pm.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cngc.pm.model.Incident;
import com.googlecode.genericdao.search.SearchResult;

public interface IncidentService {

	public void save(Incident event, String userid) throws Exception;
	boolean delByIds(String ids);
	boolean delById(Long id);
	Incident getById(Long id);
	List<Incident> getAll();
	Map<String,Object> getCountByStatus();
	SearchResult<Incident> getByStatus(String status);
	SearchResult<Incident> getNotFinished();
	Map<String,Object> getCountByCategory(String startTime,String endTime);
	Map<String,Object> getStats(String column,String row,String startTime,String endTime,String status);
	SearchResult<Incident> search(String abs,String applyUser,String engineer,String satisfaction,Date startTime,Date endTime,Integer offset,
			Integer maxResults);
	SearchResult<Incident> getByApplyUser(String user);
	SearchResult<Incident> getByApplyUser(String user,Boolean bClose);
	SearchResult<Incident> getByIds(List<Long> ids);
	SearchResult<Incident> getByProcessInstance(List<String> processInstanceIds);
	Long getIdByProcessInstance(String processInstanceId);
	List<Incident> search(String abs,String applyUser,String engineer,String satisfaction,Date startTime,Date endTime);
	void update(Incident newincident);
}
