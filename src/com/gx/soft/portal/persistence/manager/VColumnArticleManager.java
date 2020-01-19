package com.gx.soft.portal.persistence.manager;

import org.springframework.stereotype.Service;

import com.gx.core.hibernate.HibernateEntityDao;
import com.gx.soft.portal.persistence.domain.VColumnArticle;

@Service("vcolumnArticleManager")
public class VColumnArticleManager extends HibernateEntityDao<VColumnArticle> {

}
