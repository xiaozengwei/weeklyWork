package com.gx.soft.weeklywork.persistence.manager;

import com.gx.core.hibernate.HibernateEntityDao;
import com.gx.soft.weeklywork.persistence.domain.WVo;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class WvoManager  extends HibernateEntityDao<WVo>{
}
