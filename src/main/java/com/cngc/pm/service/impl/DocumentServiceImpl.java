package com.cngc.pm.service.impl;

import static com.cngc.utils.Common.isNumeric;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cngc.exception.ParameterException;
import com.cngc.pm.dao.AttachmentDAO;
import com.cngc.pm.dao.DocumentDAO;
import com.cngc.pm.dao.ResourcesDAO;
import com.cngc.pm.dao.StyleDAO;
import com.cngc.pm.dao.SysCodeDAO;
import com.cngc.pm.model.Attachment;
import com.cngc.pm.model.Document;
import com.cngc.pm.model.Resources;
import com.cngc.pm.model.Style;
import com.cngc.pm.model.SysCode;
import com.cngc.pm.model.SysUser;
import com.cngc.pm.service.DocumentService;
import com.cngc.utils.PropertyFileUtil;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchResult;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentDAO docDao;
	
	@Autowired
	private AttachmentDAO attachDao;
	
	@Autowired
	private StyleDAO styleDao;
	
	@Autowired
	private ResourcesDAO resDao;
	
	@Autowired
	private SysCodeDAO codeDao;

	@Override
	@Transactional(readOnly=true)
	public Set<Attachment> getSetAttach(String... filenames) {
		// TODO Auto-generated method stub
		return attachDao.getSet(filenames);
	}

	@Override
	@Transactional
	public void save(Document document) {
		// TODO Auto-generated method stub
		docDao.save(document);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getAll(Long userid) {
		// TODO Auto-generated method stub
		//return docDao.findAll();
		return docDao.getListBySelfAndOpen(userid);
	}

	@Override
	@Transactional(readOnly=true)
	public Map<String, String> getMapStyle() {
		// TODO Auto-generated method stub
		List<Style> list = styleDao.getListByType(10);
		
		Map<String , String> styleMaps = new HashMap<String, String>();
		for(Style style : list) {
			styleMaps.put(String.valueOf(style.getId()), style.getName());
		}
		
		return styleMaps;
	}

	@Override
	@Transactional(readOnly=true)
	public Set<Style> getSetStyle(Long... ids) {
		// TODO Auto-generated method stub
		return styleDao.getSet(ids);
	}

	@Override
	@Transactional(readOnly=true)
	public Style loadStyleById(Long id) {
		// TODO Auto-generated method stub
		return styleDao.find(id);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Style> getListStyle() {
		// TODO Auto-generated method stub
		return styleDao.getListByType(10);
	}

	@Override
	@Transactional
	public boolean delByIds(String ids) {
		// TODO Auto-generated method stub
		String id[] = ids.split(",");
		int j = id.length;
		Long[] idss = new Long[j];
		for(int i=0; i<id.length; i++) {
			String str = id[i];
			 if (!isNumeric(str)) {
				 return false;
			 }
			 idss[i] = Long.valueOf(str);
		}
		try {
			for(Long k : idss) {
				Document doc = docDao.find(k);
				
				for(Attachment attach : doc.getAttachs()) {
					attachDao.del(attach);
				}
				
				docDao.remove(doc);
				
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getAllByStyle(Long userId, Long styleId) {
		// TODO Auto-generated method stub
		return docDao.getListBySelfAndOpenAndStyle(userId, styleId);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getAllByPrivate(Long userId) {
		// TODO Auto-generated method stub
		return docDao.getListBySelf(userId);
	}

	@Override
	@Transactional
	public boolean delById(Long docid, Long userid) {
		// TODO Auto-generated method stub
		Document doc = docDao.find(docid);
		if(doc.getUser().getId() == userid) {
			for(Attachment attach : doc.getAttachs()) {
				attachDao.del(attach);
			}
			
			docDao.remove(doc);
			
			return true;
		}
		return false;
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getAllLastVersion() {
		// TODO Auto-generated method stub
		return docDao.getListByLastVersion();
	}

	@Override
	@Transactional(readOnly=true)
	public Document getById(long docid) {
		// TODO Auto-generated method stub
		return docDao.find(docid);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Style> getAllCheckItems() {
		// TODO Auto-generated method stub
		return styleDao.getListByType(47);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(Document document) {
		// TODO Auto-generated method stub
		docDao.update(document);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getByStyle(long styleid) {
		// TODO Auto-generated method stub
		Filter f = new Filter("style.id", styleid, Filter.OP_EQUAL);
		Filter f2 = new Filter("enabled", true, Filter.OP_EQUAL);
		
		return docDao.search(new Search().addFilter(f).addFilter(f2));
		//return docDao.getByStyle(styleid);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getByItem(long itemid) {
		// TODO Auto-generated method stub
		return docDao.getByItem(itemid);
	}

	@Override
	@Transactional(readOnly=true)
	public int getModuleParentIdByURL(String url) {
		// TODO Auto-generated method stub
		Resources r = resDao.getByURL(url);
		
		return r.getModule().getParent().getId().intValue();
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getListWithPagination(Integer offset,
			Integer maxResults) {
		// TODO Auto-generated method stub
		return docDao.getListWithPage(offset, maxResults);
	}
	
	@Override
	@Transactional(readOnly=true)
	public SearchResult<Document> getAll(Integer offset,
			Integer maxResults) {
		Search search = new Search();
		search.addFilterEqual("enabled", true);
		search.setFirstResult(offset == null?0:offset);
		search.setMaxResults(maxResults==null?10:maxResults);
		search.addSort("id", true);
		
		return docDao.searchAndCount(search);
	}

	@Override
	@Transactional(readOnly = true)
	public SearchResult<Document> getAllByStyle(Style style, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		
		Search search = new Search();
		search.setFirstResult(offset == null?0:offset);
		search.setMaxResults(maxResults==null?10:maxResults);
		search.addFilterEqual("style", style);
		search.addFilterEqual("enabled", true);
		search.addSort("id", true);
		
		return docDao.searchAndCount(search);
	}

	@Override
	@Transactional(readOnly = true)
	public SearchResult<Document> getAllByItem(Long itemid, Integer offset,
			Integer maxResults) {
		// TODO Auto-generated method stub
		Search search = new Search(Document.class);
		search.setFirstResult(offset == null?0:offset);
		search.setMaxResults(maxResults==null?10:maxResults);
		search.addFilterSome("checkItems", Filter.equal("id", itemid));
		search.addSort("id", true);
		
		return docDao.searchAndCount(search);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Style> getStyleListByCode(String code) {
		// TODO Auto-generated method stub
		Search search = new Search(Style.class);
		
		search.addFilterEqual("code", code);
		search.addSortAsc("order");
		
		return styleDao.search(search);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Document> getListByCode(String code) {
		// TODO Auto-generated method stub
		Search search = new Search();
		search.addFilterEqual("enabled", true);
		search.addSortDesc("createDate");
		
		List<Document> listAll = docDao.search(search);
		
		List<Document> returnList = new ArrayList<>();
		for(Document document : listAll) {
			if(getTopStyle(document.getStyle()).getCode().equals(code)) {
				returnList.add(document);
			}
		}
		return returnList;
	}

	Style getTopStyle(Style style) {
		if(style.getStyle()!=null && style.getCode() == null) {
			return getTopStyle(style.getStyle());
		} else {
			return style;
		}
	}

	@Override
	@Transactional
	public void saveStyle(Style style) {
		// TODO Auto-generated method stub
		styleDao.save(style);
	}

	@Override
	@Transactional
	public boolean enabledByIds(String ids) {
		// TODO Auto-generated method stub
		String id[] = ids.split(",");
		int j = id.length;
		Long[] idss = new Long[j];
		for(int i=0; i<id.length; i++) {
			String str = id[i];
			 if (!isNumeric(str)) {
				 throw new ParameterException("删除文档时出错，请输入正确类型的参数");
			 }
			 idss[i] = Long.valueOf(str);
		}
		
		List<Document> list = new ArrayList<>();
		
		for(Long k : idss) {
			Document doc = docDao.find(k);
			
			if(doc.getItemSet().size() > 0) {
				return false;
			}
			
			list.add(doc);
			
		}
		
		for(Document doc : list) {
			doc.setEnabled(false);
			
			docDao.save(doc);
		}
		return true;
	}

	@Override
	@Transactional(readOnly=true)
	public SearchResult<Document> getListWithPageByCode(String code,
			Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addFilterOr(new Filter("style.code", code), new Filter("style.style.code", code),new Filter("style.style.style.code", code));
		
		search.addFilterEqual("enabled", true);
		search.addSortDesc("createDate");
		search.setFirstResult(offset == null?0:offset);
		search.setMaxResults(maxResults==null?10:maxResults);

		return docDao.searchAndCount(search);
	}

	@Override
	@Transactional(readOnly=true)
	public boolean isEmptyDocsByUser(SysUser user) {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addField("id");
		search.addFilterEqual("user", user);
		
		if(docDao.search(search).isEmpty()) return true;
		
		return false;
	}

	@Override
	@Transactional(readOnly=true)
	public String getJSONByCodes(List<SysCode> codeList) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer("[");
		for(SysCode code : codeList) {
			String root = code.getCode();
			sb.append("{\"text\":\"<a href=\\\"javascript:void(0);\\\" onclick=\\\"checkself('"+code.getCodeName()+"', this);\\\">"+code.getCodeName()+"</a>\",\"id\":\""+root+"\"");
			List<Style> styleList = getStyleListByCode(code.getCode());
			if(styleList.size() > 0) {
				sb.append(",\"collapsed\":true,\"children\":[");
				for(Style style : styleList) {
					sb.append("{\"text\":\"<a href=\\\"javascript:void(0);\\\" onclick=\\\"checkself('"+style.getName()+"', this);\\\">"+style.getName()+"</a>\",\"id\":\""+root+"-"+style.getId()+"\"");
					if(style.getChild().size()>0) {
						sb.append(",\"children\":[");
						for(Style s2 : style.getChild()) {
							sb.append("{\"text\":\"<a href=\\\"javascript:void(0);\\\" onclick=\\\"checkself('"+s2.getName()+"', this);\\\">"+s2.getName()+"</a>\",\"id\":\""+root+"-"+s2.getId()+"\"");
							if(s2.getChild().size()>0) {
								sb.append(",\"children\":[");
								for(Style s3 : s2.getChild()) {
									sb.append("{\"text\":\"<a href=\\\"javascript:void(0);\\\" onclick=\\\"checkself('"+s3.getName()+"', this);\\\">"+s3.getName()+"</a>\",\"id\":\""+root+"-"+s3.getId()+"\"");
									if(s3.getChild().size()>0) {
										sb.append(",\"children\":[");
										for(Style s4 : s3.getChild()) {
											sb.append("{\"text\":\"<a href=\\\"javascript:void(0);\\\" onclick=\\\"checkself('"+s4.getName()+"', this);\\\">"+s4.getName()+"</a>\",\"id\":\""+root+"-"+s4.getId()+"\"},");
										}
										sb.deleteCharAt(sb.length()-1);
										sb.append("]");
									} 
									sb.append("},");
								}
								sb.deleteCharAt(sb.length()-1);
								sb.append("]");
							} 
							sb.append("},");
						}
						sb.deleteCharAt(sb.length()-1);
						sb.append("]");
					} 
					sb.append("},");
				}
				sb.deleteCharAt(sb.length()-1);
				sb.append("]");
			}
			sb.append("},");
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		return sb.toString();
	}

	@Override
	@Transactional
	public boolean delStyle(Long id) {
		// TODO Auto-generated method stub
		Style style = styleDao.find(id);
		
		if(style.getChild().size()>0) return false;
		
		return styleDao.remove(style);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Document> getListByUserAndNum(String username, int num) {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addFilterEqual("user.username", username);
		search.addFilterEqual("enabled", true);
		
		if(num > 0) {
			search.setFirstResult(0);
			search.setMaxResults(num);
		}
			
		search.addSortDesc("createDate");
			
		return docDao.search(search);
	}

	@Override
	@Transactional(readOnly=true)
	public SysCode getCode(Document doc) {
		// TODO Auto-generated method stub
		Search search = new Search();
		search.addFilterEmpty("style");
		search.addFilterEqual("code", "document_");
		Style style = styleDao.searchUnique(search);
		
		Style style2 = getStyleTopParent(doc.getStyle(), style.getId());
		
		String code = style2.getCode();
		
		Search search1 = new Search();
		search1.addFilterEqual("code", code);
		search1.addFilterEqual("type", PropertyFileUtil.getStringValue("syscode.cms.ci.system"));
		
		
		return codeDao.searchUnique(search1);
	}
	
	private Style getStyleTopParent(Style style, long topId) {
		if(style.getStyle().getId() == topId) {
			return style;
		} else {
			return getStyleTopParent(style.getStyle(), topId);
		}
	}

	@Override
	@Transactional
	public boolean delAttachById(long docid,long attachId) {
		// TODO Auto-generated method stub
		Document doc = docDao.find(docid);
		Set<Attachment> set = doc.getAttachs();
		Attachment attach = attachDao.find(attachId);
		set.remove(attach);
		doc.setAttachs(set);
		
		return docDao.save(doc);
	}

	@Override
	@Transactional(readOnly=true)
	public Set<Attachment> getAttachsByDoc(Document document) {
		// TODO Auto-generated method stub
		Document doc = docDao.find(document.getId());
		return doc.getAttachs();
	}

	@Override
	@Transactional
	public void refreshDoc(Document doc) {
		// TODO Auto-generated method stub
		docDao.refresh(doc);
	}

	@Override
	@Transactional
	public void mergeDoc(Document doc) {
		// TODO Auto-generated method stub
		docDao.merge(doc);
	}

}
