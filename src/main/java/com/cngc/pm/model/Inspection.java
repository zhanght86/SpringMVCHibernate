package com.cngc.pm.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wk_inspection")
public class Inspection implements Serializable{
	
	private Long id;
	private String template;
	private String templateData;
	private String executionUser;
	private Date executionTime;
	private String status;
	private String processInstanceId;
	private Date createdTime;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Column(name = "template")
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	@Column(name = "template_data")
	public String getTemplateData() {
		return templateData;
	}
	public void setTemplateData(String templateData) {
		this.templateData = templateData;
	}
	@Column(name = "execution_user")
	public String getExecutionUser() {
		return executionUser;
	}
	public void setExecutionUser(String executionUser) {
		this.executionUser = executionUser;
	}
	@Column(name = "execution_time")
	public Date getExecutionTime() {
		return executionTime;
	}
	public void setExecutionTime(Date executionTime) {
		this.executionTime = executionTime;
	}
	@Column(name = "status_")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "process_instance_id")
	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	@Column(name="created_time")
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	
}