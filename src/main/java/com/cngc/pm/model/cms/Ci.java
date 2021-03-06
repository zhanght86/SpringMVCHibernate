package com.cngc.pm.model.cms;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.Where;
import org.springframework.format.annotation.DateTimeFormat;

import com.cngc.pm.model.Attachment;

/**
 * 配置项信息实体
 * 
 * @author andy
 *
 */
@Entity
@Table(name = "cms_ci")
public class Ci {

	private Long id;
	private String name;
	private String model;
	private String use;
	@Column(name="is_use")
	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	private String importance;
	@Column(name="importance")
	public String getImportance() {
		return importance;
	}

	public void setImportance(String importance) {
		this.importance = importance;
	}
	
	private String desc;
	@Column(name="desc_")
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	private String securityNo;
	private String securityLevel;
	private String system;
	private String categoryCode;
	private String incidence;
	private String location;
	private String departmentInUse;
	private String departmentInMaintenance;
	private String userInMaintenance;
	private Date serviceStartTime;
	private Date serviceEndTime;
	private String serviceLevel;
	private String serviceProvider;
	private String serviceProviderContact;
	private String reviewStatus;
	private Date lastReviewTime;
	private String deleteStatus;
	private Date deleteTime;
	private String producer;
	private String status;
	private String purpose;
	private Date expirationTime;
	private String ciManager;
	private Date createdTime;
	private String lastUpdateUser;
	private Date lastUpdateTime;
	private String remark;
	private String propertiesData;
	private String num;
	private String serial;
	
	@Column(name = "num_")
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Column(name = "serial_")
	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	@Transient
	private String statusName;
	@Transient
	private String reviewStatusName;
	@Transient
	private String deleteStatusName;
	@Transient
	private String categoryName;
	@Transient
	private String securityLevelName;
	@Transient
	private String systemName;
	@Transient
	private String userInMaintenanceName;
	@Transient
	private String departmentName;
	
	private Set<Attachment> attachs = new HashSet<>();							//附件
	
	@OneToMany(targetEntity = Attachment.class, fetch = FetchType.EAGER)
	@JoinColumn(name="type_id", referencedColumnName="id")
	@Where(clause="type_ = 3")
	public Set<Attachment> getAttachs() {
		return attachs;
	}

	public void setAttachs(Set<Attachment> attachs) {
		this.attachs = attachs;
	}

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name="model")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	@Column(name="security_level")
	public String getSecurityLevel() {
		return securityLevel;
	}

	public void setSecurityLevel(String securityLevel) {
		this.securityLevel = securityLevel;
	}
	@Column(name="system")
	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	@Column(name = "security_no")
	public String getSecurityNo() {
		return securityNo;
	}

	public void setSecurityNo(String securityNo) {
		this.securityNo = securityNo;
	}

	@Column(name = "category_code")
	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	@Column(name = "incidence")
	public String getIncidence() {
		return incidence;
	}

	public void setIncidence(String incidence) {
		this.incidence = incidence;
	}

	@Column(name = "location")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "department_in_use")
	public String getDepartmentInUse() {
		return departmentInUse;
	}

	public void setDepartmentInUse(String departmentInUse) {
		this.departmentInUse = departmentInUse;
	}

	@Column(name = "department_in_maintenance")
	public String getDepartmentInMaintenance() {
		return departmentInMaintenance;
	}

	public void setDepartmentInMaintenance(String departmentInMaintenance) {
		this.departmentInMaintenance = departmentInMaintenance;
	}

	@Column(name = "user_in_maintenance")
	public String getUserInMaintenance() {
		return userInMaintenance;
	}

	public void setUserInMaintenance(String userInMaintenance) {
		this.userInMaintenance = userInMaintenance;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "service_start_time")
	public Date getServiceStartTime() {
		return serviceStartTime;
	}

	public void setServiceStartTime(Date serviceStartTime) {
		this.serviceStartTime = serviceStartTime;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "service_end_time")
	public Date getServiceEndTime() {
		return serviceEndTime;
	}

	public void setServiceEndTime(Date serviceEndTime) {
		this.serviceEndTime = serviceEndTime;
	}

	@Column(name = "service_level")
	public String getServiceLevel() {
		return serviceLevel;
	}

	public void setServiceLevel(String serviceLevel) {
		this.serviceLevel = serviceLevel;
	}

	@Column(name = "service_provider")
	public String getServiceProvider() {
		return serviceProvider;
	}

	public void setServiceProvider(String serviceProvider) {
		this.serviceProvider = serviceProvider;
	}

	@Column(name = "service_provider_contact")
	public String getServiceProviderContact() {
		return serviceProviderContact;
	}

	public void setServiceProviderContact(String serviceProviderContact) {
		this.serviceProviderContact = serviceProviderContact;
	}

	@Column(name = "review_status")
	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	@Column(name = "last_review_time")
	public Date getLastReviewTime() {
		return lastReviewTime;
	}

	public void setLastReviewTime(Date lastReviewTime) {
		this.lastReviewTime = lastReviewTime;
	}

	@Column(name = "delete_status")
	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	@Column(name = "delete_time")
	public Date getDeleteTime() {
		return deleteTime;
	}

	public void setDeleteTime(Date deleteTime) {
		this.deleteTime = deleteTime;
	}

	@Column(name = "producer")
	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	@Column(name = "status_")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "purpose")
	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "expiration_time")
	public Date getExpirationTime() {
		return expirationTime;
	}

	public void setExpirationTime(Date expirationTime) {
		this.expirationTime = expirationTime;
	}

	@Column(name = "ci_manager")
	public String getCiManager() {
		return ciManager;
	}

	public void setCiManager(String ciManager) {
		this.ciManager = ciManager;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "created_time")
	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	@Column(name = "last_update_user")
	public String getLastUpdateUser() {
		return lastUpdateUser;
	}

	public void setLastUpdateUser(String lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	@Column(name = "last_update_time")
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "properties_data")
	public String getPropertiesData() {
		return propertiesData;
	}

	public void setPropertiesData(String propertiesData) {
		this.propertiesData = propertiesData;
	}
	@Formula(value="(SELECT a.code_name FROM sys_code a WHERE a.type_='CI_STATUS' AND a.code_= status_)")
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	@Formula(value="(SELECT a.code_name FROM sys_code a WHERE a.type_='CI_REVIEW_STATUS' AND a.code_= review_status)")
	public String getReviewStatusName() {
		return reviewStatusName;
	}

	public void setReviewStatusName(String reviewStatusName) {
		this.reviewStatusName = reviewStatusName;
	}
	@Formula(value="(SELECT a.code_name FROM sys_code a WHERE a.type_='CI_DELETE_STATUS' AND a.code_= delete_status)")
	public String getDeleteStatusName() {
		return deleteStatusName;
	}

	public void setDeleteStatusName(String deleteStatusName) {
		this.deleteStatusName = deleteStatusName;
	}
	@Formula(value="(SELECT a.category_name FROM cms_category a WHERE a.category_code = category_code)")
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Formula(value="(SELECT a.code_name FROM sys_code a WHERE a.type_='CI_SECURITY_LEVEL' AND a.code_= security_level)")
	public String getSecurityLevelName() {
		return securityLevelName;
	}

	public void setSecurityLevelName(String securityLevelName) {
		this.securityLevelName = securityLevelName;
	}
	@Formula(value="(SELECT a.code_name FROM sys_code a WHERE a.type_='CI_SYSTEM' AND a.code_= system)")
	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	@Formula(value="(SELECT a.NAME FROM sys_users a WHERE a.USERNAME=user_in_maintenance)")
	public String getUserInMaintenanceName() {
		return userInMaintenanceName;
	}

	public void setUserInMaintenanceName(String userInMaintenanceName) {
		this.userInMaintenanceName = userInMaintenanceName;
	}
	@Formula(value="(SELECT a.group_name FROM sys_group a WHERE a.id=department_in_use)")
	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

}
