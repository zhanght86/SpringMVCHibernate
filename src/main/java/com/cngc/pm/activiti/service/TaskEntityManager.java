package com.cngc.pm.activiti.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Service;

import com.cngc.pm.activiti.jpa.entity.TaskJpaEntity;
import com.cngc.pm.service.MessageService;

@Service
public class TaskEntityManager {
	
    @PersistenceContext
    private EntityManager entityManager;
    @Resource
    private MessageService messageService;

    @Transactional
    public TaskJpaEntity newTask(DelegateExecution execution) {
    	TaskJpaEntity task = new TaskJpaEntity();
    	task.setProcessInstanceId(execution.getProcessInstanceId());
    	task.setFromUser(execution.getVariable("fromUser").toString());
    	task.setToUser(execution.getVariable("toUser").toString());
    	task.setTaskTitle(execution.getVariable("taskTitle").toString());
        task.setApplyTime(new Date());
        task.setDueTime((Date)execution.getVariable("dueTime"));
/*        try
        {
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	Date date = sdf.parse(execution.getVariable("dueTime").toString());
        	task.setDueTime(execution.getVariable("dueTime"));
        }
        catch(ParseException e)
        {
        	System.out.println(e.getMessage());
        }*/
        entityManager.persist(task);
        return task;
    }
    @Transactional
    public boolean setTaskStatus(DelegateExecution execution){
    	TaskJpaEntity task = (TaskJpaEntity)execution.getVariable("mytask");
    	task.setExecutionTime(new Date());
    	entityManager.persist(task);
    	return true;
    }
    @Transactional
    public void save(TaskJpaEntity task) {
        entityManager.persist(task);
    }

    public TaskJpaEntity getTask(Long id) {
        return entityManager.find(TaskJpaEntity.class, id);
    }
}
